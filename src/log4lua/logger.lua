--
-- Copyright (C) 2016 Meng Zhang @ Yottaa,Inc
-- Copyright (C) 2018 4mig4
--
-- logger
--

local logger = {}

local channel = require 'log4lua.channel'



-- logging scaffold
local log = channel.logger()
local level_ = channel.levels().INFO

function logger.set_level(level)
  level_ = level
end

function logger.error(...)
  if level_ < ERR then
    return
  end
  log(ERR, commom.table_to_string({...}))
end

function logger.info(...)
  if level_ < INFO then
    return
  end
  log(INFO, commom.table_to_string({...}))
end

function logger.dbg(...)
  if level_ ~= DEBUG then
    return
  end

  log(DEBUG, commom.table_to_string({...}))
end

function logger.is_debug_enabled()
  return level_ == DEBUG
end

return logger

