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

local channel = {
    level = require 'log4lua.level'
}

--- Function to perform log through nxg log object
local function ngx_log(level_, str)
    _G.ngx.log(level_.value, str)
end

--- Function to perform log through print function
local function print_log(level_, str)
    print(string.format('[%s] %s %s', level_.name, os.date("%Y-%m-%d %H:%M:%S"), str))
end


--- Function to get log leve from globlal environment if it's already set
--- other else it'll return false
function channel:get_log_level()
    if _G.LOG_LEVEL then
        return  _G.LOG_LEVEL
    end

    return self.level.INFO
end

--- method to peform the log based on level and the king of channel.
function channel:log(level_, ...)
    if level_.value > self.level.current.value then
        return
    end
    
    self.log_func(level_, helper.table_to_string({...}))
end

-- set the log level. 
channel.level:set_level(channel:get_log_level())

-- decide between ngx log or print log
channel.log_func = _G.ngx and ngx_log or print_log

return channel