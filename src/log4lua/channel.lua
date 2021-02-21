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

local helper = require 'log4lua.helper'
local level  = require 'log4lua.level'

local Channel = {}
Channel.__index = Channel

local function ngx_log(level, str)
    _G.ngx.log(level.value, str)
end

local function print_log(level, str)
    
    print(string.format('[%s] %s %s %s', level.name, os.date("%Y-%m-%d %H:%M:%S"), a, str))
end

local function get_file_name(file_path)
    return debug.getinfo(1, 'Snl').source:match("([^/]+)$")
end

local function get_log_level()
    if _G.log_level then
        return _G.log_level
    end

    return level.INFO
end

function Channel.new(file_path)
    local self = setmetatable({}, Channel)
    
    self.file = get_file_name(file_path)

    level:set_level(get_log_level())

    self.log_func = _G.ngx and ngx_log or print_log

    return self
end

function Channel:log(level, ...)
    if level.value < self.level.value then
        return
    end

    self.log_func(level, helper.table_to_string({...}))
end

return Channel
