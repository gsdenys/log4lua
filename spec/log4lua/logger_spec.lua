-- Copyright 2021 gsdenys. All Rights Reserved.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http:--www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

require 'busted.runner'()

describe("log4lua.logger", function()
    local level = require 'log4lua.level'
    local performer = require 'log4lua.performer'
    
    describe("level basics", function()
        local logger = require 'log4lua.logger'

        it("level should exist", function() 
            assert.truthy(logger.level)
        end)

        it("level should be INFO", function()
            assert.are.equals(logger.level, level.INFO)
        end)
    end)

    describe("level basics", function()
        it("performer should exist", function()
            local logger = require 'log4lua.logger'
            assert.truthy(logger.performer)
        end)

        it("performer should be stdout", function()
            local logger = require 'log4lua.logger'
            assert.are.equals(logger.performer, performer.stdout)
        end)

        it("performer should be nginx", function()
            _G.ngx = {
                log = function(str)
                    -- just a mock function
                end
            }

            local logger = require 'log4lua.logger'

            nginx = _G.ngx

            spy.on(nginx, "log")
            performer.nginx(level.INFO, "hello world")
            assert.spy(nginx.log).was.called()
        end)
    end)

end)
    