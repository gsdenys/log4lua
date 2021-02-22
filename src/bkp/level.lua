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


--- Level module to decide itself between the log levels type according the
--- deploy location. Nowadays, there are 2 kinds of deploy location, inside 
--- and outside openresty/nginx.
--- @module level
local level = {
  CRIT   = { value = 3, name = "CRIT"   },
  ERR    = { value = 4, name = "ERR"    }, 
  WARN   = { value = 5, name = "WARN"   },
  NOTICE = { value = 6, name = "NOTICE" },
  INFO   = { value = 7, name = "INFO"   },
  DEBUG  = { value = 8, name = "DEBUG"  },

  current = {}
}

--- setlevel function to redefine the log level that'll be used on the system.
function level:set_level(level_)
    self.current = level_
end

-- set level default as INFO
level:set_level(level.INFO)

return level
