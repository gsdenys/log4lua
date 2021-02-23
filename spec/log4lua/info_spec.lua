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

describe("log4lua.info", function()
    local info = require 'log4lua.info'
    
    it("_COPYRIGHT Should not be empty.", function()
        local copy_right = info._COPYRIGHT
        
        assert.truthy(copy_right)
        assert.falsy(#copy_right == 0)
    end)

    it("_DESCRIPTION Should not be empty.", function()
        local desc = info._DESCRIPTION
        
        assert.truthy(desc)
        assert.falsy(#desc == 0)
    end)

    it("_VERSION Should not be empty.", function()
        local version = info._VERSION
        
        assert.truthy(version)
        assert.falsy(#version == 0)
    end)
end)
    