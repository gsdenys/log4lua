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

-- test case for logger.debug
describe("logger.debug", function()
    local level = require 'log4lua.level'

    -- use the local logger. in this case method print
    describe("Local", function()
        -- ovewrite function print and use a mock to do not print output
        _G.print = function(src)
            -- just a mock function
        end

        -- get logger and set info level
        local logger = require 'log4lua.logger'
        logger:set_level(level.INFO)
    
    
        it("logger.info should call print function", function()    
            spy.on(_G, "print")
            logger:info("hello world")
            assert.spy(_G.print).was.called()
        end)

        it("logger.error should call print function", function()
            spy.on(_G, "print")
            logger:error("hello world")
            assert.spy(_G.print).was.called()
        end)
    
        it("logger.debug should not call print function", function()
            spy.on(_G, "print")
            logger:debug("hello world")
            assert.spy(_G.print).was_not.called()
        end)
    end)
    
    _G.ngx = {
        log = function(level, log_str)
            print("ola")
            -- just a mock function to simuleta ngx log
        end
    }

    describe("NGINX", function()
        local logger = require 'log4lua.logger'
        logger:set_level(level.INFO)

        it("logger.info should call _G.ngx.log function", function()    
            spy.on((_G.ngx), "log")
            logger:info("hello world")
            assert.spy((_G.ngx).log).was.called()
        end)

        it("logger.error should call _G.ngx.log function", function()
            spy.on((_G.ngx), "log")
            logger:error("hello world")
            assert.spy((_G.ngx).log).was.called()
        end)

        it("logger.debig should not call _G.ngx.log function", function()
            spy.on((_G.ngx), "log")
            logger:debug("hello world")
            assert.spy((_G.ngx).log).was_not.called()
        end)
    end)
end)
    