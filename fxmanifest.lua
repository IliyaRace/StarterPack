fx_version 'cerulean'
game 'gta5'

author 'IliyaRace_YT'
description 'Script Starter Pack ESX Fivem '
version '1.0.0'

shared_scripts {
    'config.lua' -- فایل کانفیگ
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', -- اضافه کردن MySQL-Async
    'server/server.lua'}
