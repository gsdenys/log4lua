
return {
    DEBUG  = (_G.ngx and _G.ngx.DEBUG)  or 8,
    INFO   = (_G.ngx and _G.ngx.INFO)   or 7,
    NOTICE = (_G.ngx and _G.ngx.NOTICE) or 6,
    WARN   = (_G.ngx and _G.ngx.WARN)   or 5,
    ERR    = (_G.ngx and _G.ngx.ERR)    or 4,
    CRIT   = (_G.ngx and _G.ngx.CRIT)   or 3
}
 
