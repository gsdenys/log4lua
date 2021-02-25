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

-- add _G.ngx object to simulate NGINX environment
_G.ngx = {
    log = function(level, log_str)
        -- just a mock function to simuleta ngx log
    end
}

local level = require 'log4lua.level'

describe("NGINX", function()
    it("_G.ngx.log should be called", function()
        local logger = require 'log4lua.logger'
        logger:set_level(level.DEBUG)
        
        spy.on((_G.ngx), "log")
        logger:debug("hello world")
        assert.spy((_G.ngx).log).was.called()
    end)

    it("_G.ngx.log should no be called", function()
        local logger = require 'log4lua.logger'
        logger:set_level(level.INFO)
        
        spy.on((_G.ngx), "log")
        logger:debug("hello world")
        assert.spy((_G.ngx).log).was_not.called()
    end)
end)
    