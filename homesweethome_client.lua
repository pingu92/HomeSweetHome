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
