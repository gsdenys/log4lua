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


--- The log levels according their priority
local available = {
    CRIT   = 3,
    ERR    = 4,
    WARN   = 5,
    NOTICE = 6,
    INFO   = 7,
    DEBUG  = 8
}

--- Level module to decide itself between the log levels type according the
--- deploy location. Nowadays, there are 2 kinds of deploy location, inside 
--- and outside openresty/nginx.
--- @module level
local level = {
  types = available,
  current = {}
}

--- get_key_for_value local function to create the available invese map. It's
--- usefull to get the key name based on value
local function get_key_for_value(value )
  for k,v in pairs(available) do
    if v==value then return k end
  end
  return nil
end

--- setlevel function to redefine the log level that'll be used on the system.
--- There are 6 kind of levels:
---     1. DEBUG
---     2. INFO
---     3. NOTICE
---     4. WARN
---     5. ERR
---     6. CRIT
function level:set_level(level)
    local level_name = get_key_for_value(level)
    self.current = {name= level_name,  value=level} 
end

-- By default the log level is initiated as level INFO
level:set_level(level.types.INFO)

return level
