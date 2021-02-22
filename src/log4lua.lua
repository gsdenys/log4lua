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

require 'pl'

local info = require 'log4lua.info'
local level = require 'log4lua.level'



-- create composition of log4lua and info table
local log4lua = tablex.merge(level, info, true)

--- Create new logger object that possibilite use of log element
function log4lua.get_logger(level_)
    local logger = require 'log4lua.logger'

    if level_ ~= nil then
        logger.set_level(level_)
    end

end

return log4lua