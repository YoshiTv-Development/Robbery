fx_version 'adamant'
game 'gta5'
lua54 'yes'
author 'YoshiTv'
discord 'https://discord.gg/udH3eUJ2EB'
description 'Easy Robbery System'
description 'Robbery'

shared_script {
    '@ox_lib/init.lua',
    'shared/config.lua'
}

server_script {
    'server/server.lua'
}

client_script {
    'client/client.lua'
}