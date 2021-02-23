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

local level = require 'log4lua.level'
local performer = require 'performer'
local helper = require 'helper'

local logger = {
    --- The default logger level
    level = level.INFO,

    --- The default logger performer based on the deploy environment
    performer = _G.ngx and performer.nginx or performer.stdout 
}

--- Set the log level. in case of level are nil, the level info will be selected.
function logger:set_level(level_)
    if level_ == nil then
        self.level = level.INFO
        return
    end

    self.level = level_
end

--- Perform the log using the selected performer.
local function logger:log(level_, ...)
    if level.value < self.level.value then
        return
    end

    local str = helper.table_to_string({...})
    self.performer(level_, str)
end

--- log debug
local function logger:debug(...)
    self.log(level.DEBUG, {...})
end

local function logger:info(...)
    self.log(level.INFO, {...})
end

local function logger:notice(...)
    self.log(level.NOTICE, {...})
end

local function logger:warn(...)
    self.log(level.WARN, {...})
end

local function logger:error(...)
    self.log(level.ERROR, {...})
end

local function logger:crit(...)
    self.log(level.CRIT, {...})
end