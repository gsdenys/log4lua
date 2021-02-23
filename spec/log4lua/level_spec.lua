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

    describe("DEBUG", function()
        it("should not be empty.", function()
            assert.truthy(level.DEBUG)
        end)

        it("should have name DEBUG.", function()
            assert.equals(level.DEBUG.name, "DEBUG")
        end)

        it("should have value 8.", function()
            assert.equals(level.DEBUG.value, 8)
        end)
    end)

    describe("INFO", function()
        it("should not be empty.", function()
            assert.truthy(level.INFO)
        end)

        it("should have name INFO.", function()
            assert.equals(level.INFO.name, "INFO")
        end)

        it("should have value 7.", function()
            assert.equals(level.INFO.value, 7)
        end)
    end)

    describe("NOTICE", function()
        it("should not be empty.", function()
            assert.truthy(level.NOTICE)
        end)

        it("should have name INFO.", function()
            assert.equals(level.NOTICE.name, "NOTICE")
        end)

        it("should have value 6.", function()
            assert.equals(level.NOTICE.value, 6)
        end)
    end)

    describe("WARN", function()
        it("should not be empty.", function()
            assert.truthy(level.WARN)
        end)

        it("should have name WARN.", function()
            assert.equals(level.WARN.name, "WARN")
        end)

        it("should have value 5.", function()
            assert.equals(level.WARN.value, 5)
        end)
    end)

    describe("ERROR", function()
        it("should not be empty.", function()
            assert.truthy(level.ERROR)
        end)

        it("should have name ERROR.", function()
            assert.equals(level.ERROR.name, "ERROR")
        end)

        it("should have value 4.", function()
            assert.equals(level.ERROR.value, 4)
        end)
    end)

    describe("CRIT", function()
        it("should not be empty.", function()
            assert.truthy(level.CRIT)
        end)

        it("should have name CRIT.", function()
            assert.equals(level.CRIT.name, "CRIT")
        end)

        it("should have value 3.", function()
            assert.equals(level.CRIT.value, 3)
        end)
    end)
end)