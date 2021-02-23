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

describe("log4lua.helper", function()
    local helper = require 'log4lua.helper'

    describe("to_string", function()
        it("should return nil", function()
            local val = nil
            str = helper.to_string(val)

            assert.equals(str, "")
        end)

        it("should return 'hello world'", function()
            local val = 'hello world'
            str = helper.to_string(val)

            assert.equals(str, "hello world")
        end)

        it("should return '[hello:world ola:mundo]'", function()
            local val = {
                hello = "world",
                ola = "mundo"
            }
            str = helper.to_string(val)

            assert.equals(str, "[hello:world ola:mundo]")
        end)

        it("should return '[lang:[hello:world ola:mundo]]'", function()
            local val = {
                lang = {
                    hello = "world",
                    ola = "mundo"
                }
            }
            str = helper.to_string(val)

            assert.equals(str, "[lang:[hello:world ola:mundo]]")
        end)
    end)

    describe("table_to_string", function()
        it("should return '[hello:world ola:mundo] [bonjour:le monde holla:mundo]'", function()
            local val = {
                {
                    hello = "world",
                    ola = "mundo"
                },
                {
                    holla = "mundo",
                    bonjour = "le monde"
                }
            }
            str = helper.table_to_string(val)

            assert.equals(str, "[hello:world ola:mundo] [bonjour:le monde holla:mundo]")
        end)
    end)

end)