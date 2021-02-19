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


--- Level module to decise itself between the log levels type according 
--- the deploy location.
--- The possible leves according the decreasing priority are:
---     1. DEBUG
---     2. INFO
---     3. NOTICE
---     4. WARN
---     5. ERR
---     6. CRIT
--- Nowadays, there are 2 kinds of log levels, the NGX and Print.
---
--- @module level
local level = {
    DEBUG  = if _G.ngx then _G.ngx.DEBUG  else 8 end,
    INFO   = if _G.ngx then _G.ngx.INFO   else 7 end,
    NOTICE = if _G.ngx then _G.ngx.NOTICE else 6 end,
    WARN   = if _G.ngx then _G.ngx.WARN   else 5 end,
    ERR    = if _G.ngx then _G.ngx.ERR    else 4 end,
    CRIT   = if _G.ngx then _G.ngx.CRIT   else 3 end
}
 
-- return the level object
return level
