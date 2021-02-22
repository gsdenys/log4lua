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

describe("log4lua.channel", function()
    local channel = require 'log4lua.channel'
    local level = require 'log4lua.level'

    describe("Default Level", function()
        it("Should return log INFO", function()
            assert.are.same(level.INFO, channel.level.current)
        end)
    end)

    describe("_G.LOG_LEVEL", function()
        it("Should return log ERR", function()
            _G.LOG_LEVEL = level.ERR
            
            local c = require 'log4lua.channel'

            assert.are.same(c.level.current, level.ERR)
        end)
    end)
end)