fx_version 'cerulean'

games {
    'gta5',
    'rdr3'
}

client_scripts {
  '@k20-lib/client/cl_rpc.lua',
  '@k20-lib/client/cl_ui.lua',
  '@k20-lib/client/cl_polyhooks.lua',
	'client/cl_*.lua'
}

shared_scripts {
  '@k20-lib/shared/sh_util.lua',
	"shared/*.lua"
}

server_scripts {
  '@k20-lib/server/sv_rpc.lua',
  '@k20-lib/server/sv_sql.lua',
	'server/*.lua'
}