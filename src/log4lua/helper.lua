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


--- Transform table to string
local function table_to_string(tbl)
    local res = ""
    local first = true

    for _,value in pairs(tbl) do
      if not first then
        res = res .. " "
      else
        first = false
      end
      res = res .. to_string(value)
    end

    return res
end


function to_string(object_)
    if object_ == nil then
        return ""
    end

    if type(object_) ~= "table" then
        return tostring(object_)
    end

    local tbl_string = "["
    local first = true

    for key,value in pairs(object_) do
        if not first then
            tbl_string = tbl_string .. " "
        else
            first = false
        end
        
        if key ~= nil then
            tbl_string = tbl_string .. to_string(key) .. ":"
        end
        if value ~= nil then
            tbl_string = tbl_string .. to_string(value)
        end
    end

    tbl_string = tbl_string .. "]"

    return tbl_string
end

return {
    ['table_to_string'] = table_to_string,
    ['to_string'] = to_string
}