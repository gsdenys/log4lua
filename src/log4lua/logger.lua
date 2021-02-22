--
-- Copyright (C) 2016 Meng Zhang @ Yottaa,Inc
-- Copyright (C) 2018 4mig4
--
-- logger
--

local level = require 'log4lua.level' 
local channel = require 'log4lua.channel'

local logger = {
}

function logger.set_level(level_)
   channel:set_level(level_)
end

function logger.error(...)
  channel:log(level.ERR, {...})
end

function logger.info(...)
  channel:log(level.INFO, {...})
end

function logger.debug(...)
  channel:log(level.DEBUG, {...})
end

return logger

