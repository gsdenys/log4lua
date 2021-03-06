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

--- perform log using print method
function stdout(level_, log_str)
    msg =string.format('[%s] %s %s', level_.name, os.date("%Y-%m-%d %H:%M:%S"), log_str)
    print(msg)
end

--- perform log using nginx log method
function nginx(level_, log_str)
    _G.ngx.log(level_.value, log_str)
end

-- return performers
return {
    ['stdout'] = stdout,
    ['nginx'] = nginx
}