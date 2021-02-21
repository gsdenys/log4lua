local level = require('log4lua.level')
local channel = require('log4lua.channel')

local ch = channel.new(level.INFO)
ch:log(level.INFO, "ola")

-- logger.info(level.DEBUG)