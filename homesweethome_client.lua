homesweethome_client = {
constants = require 'constants'
}
local player_service_trace = nil

local function check_override_ui(players, player_id)
	if not player_id then
		player_id = 'player_1'
	end

	local client_player = players[player_id]
	if client_player then
		if client_player.kingdom == "rayyas_children:kingdoms:rayyas_children" then
			_radiant.res.apply_manifest("/homesweethome/rayyas_children_selected/manifest.json")
		end
	end
end

local function trace_player_service()
	_radiant.call('stonehearth:get_service', 'player')
	:done(function(r)
		local player_service = r.result
		check_override_ui(player_service:get_data().players)
		player_service_trace = player_service:trace('rayyas children ui change')
		:on_changed(function(o)
			check_override_ui(player_service:get_data().players)
			end)
		end)
end

radiant.events.listen(homesweethome_client, 'radiant:init', function()
	trace_player_service()
	end)

return homesweethome_client
