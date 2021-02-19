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
    DEBUG  = _G.ngx? _G.ngx.DEBUG  : 8,
    INFO   = _G.ngx? _G.ngx.INFO   : 7,
    NOTICE = _G.ngx? _G.ngx.NOTICE : 6,
    WARN   = _G.ngx? _G.ngx.WARN   : 5,
    ERR    = _G.ngx? _G.ngx.ERR    : 4,
    CRIT   = _G.ngx? _G.ngx.CRIT   : 3
}
 
-- return the level object
return level
