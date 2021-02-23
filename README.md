# log4lua

A simple log library for lua. It can be applyed to a NGINX/OpenResty or lua script.

## Install

To install it, you must to install throug [luarocks](https://luarocks.org/) using the comand below.

```bash
luarocks install log4lua
```

## Usage


The following code is an use example of __log4lua__ data. 

```lua
local log4lua = require 'log4lua' 
log = log4lua.get_logger(self)

log.crit("Hello crit")
log.error("Hello Error")
log.warn("Hello Warn")
log.notice("Hello Notice")
log.info("Hello Info")
log.debug("Hello Debug")
```

## License

Licensed to the Apache Software Foundation (ASF) under one or more contributor license agreements.  See the NOTICE file distributed with this work for additional information regarding copyright ownership.  The ASF licenses this file to you under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
