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

describe("log4lua.level", function()
    local level = require 'log4lua.level'

    describe("Default Level", function()
        it("Should return log INFO", function()

            local test = {name = "INFO", value = 7}
            assert.are.same(level.current, test)
        end)
    end)
    
    describe("set_level", function()
        it("Should return log ERR", function()
            level:set_level(level.types.ERR)

            local test = {name = "ERR", value = 4}
            assert.are.same(level.current, test)
        end)
    end)
end)