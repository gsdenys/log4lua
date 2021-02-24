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

describe("log4lua.performer", function()
    local level = require 'log4lua.level'
    
    describe("print", function()
        it("should be called", function() 
            local performer = require 'log4lua.performer'

            local bkp = _G.print
            _G.print = function(str) 
                -- just a mock for test propouse
            end

            spy.on(_G, "print")
            performer.stdout(level.INFO, "hello world")
            assert.spy(print).was.called()

            _G.print = bkp
        end)
    end)

    describe("nginx", function()
        it("should be called", function() 
            local performer = require 'log4lua.performer'
            
            _G.ngx = {
                log = function(log_str)
                    -- just a mock function to simuleta ngx log
                end
            }

            nginx = _G.ngx

            spy.on(nginx, "log")
            performer.nginx(level.INFO, "hello world")
            assert.spy(nginx.log).was.called()
        end)
    end)
end)
    