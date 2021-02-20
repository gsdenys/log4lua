package = "log4lua"
version = "scm-1"
source = {
  url = "git://github.com/gsdenys/log4lua.git"
}
description = {
   summary = "Multi environment lua logger",
   detailed = [[
      A lua logger library that works in a simple environment and also resty/nginx.
      This was initially developed to decouple the log lib from amqp-client library.
   ]],
   homepage = "https://github.com/gsdenys/log4lua",
   maintainer = "Denys G. Santos <gsdenys@gmail.com>",
   license = "Apache 2.0"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
     ['log4lua'] = "src/log4lua/logger.lua",
     ['log4lua.level'] = "src/log4lua/level.lua",
     ['log4lua.helper'] = "src/log4lua/helper.lua",
     ['log4lua.channel'] = "src/log4lua/channel.lua",
   }
}
