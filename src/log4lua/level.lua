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


--- The log system main module.
local level = {
    --- Any error that is forcing a shutdown of the service or application to prevent 
    --- data loss (or further data loss). It's reserved only for the most heinous errors 
    --- and situations where there is guaranteed to have been data corruption or loss.
    CRIT   = { value = 3, name = "CRIT" },

    --- Any error which is fatal to the operation, but not the service or application 
    --- (can't open a required file, missing data, etc.). These errors will force user
    --- (administrator, or direct user) intervention. These are usually reserved for 
    --- incorrect connection strings, missing services, etc.
    ERROR  = { value = 4, name = "ERROR" },

    --- Anything that can potentially cause application oddities, but for which 
    --- automatically recovering.
    WARN   = { value = 5, name = "WARN" },

    --- The same of INFO but that need to be highlighted notes.
    NOTICE = { value = 6, name = "NOTICE" },

    --- Useful information to log (service start/stop, configuration assumptions, etc). 
    --- Info is always available but usually don't care about under normal circumstances. 
    --- This is the out-of-the-box config level.
    INFO   = { value = 7, name = "INFO" },

     --- Information that is diagnostically helpful to people more than just developers (IT, sysadmins, etc.).
    DEBUG  = { value = 8, name = "DEBUG" } 
}

return level