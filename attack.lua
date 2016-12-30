local attacking

local f = CreateFrame'Frame'
f:RegisterEvent'PLAYER_ENTER_COMBAT'
f:RegisterEvent'PLAYER_LEAVE_COMBAT'
f:SetScript('OnEvent', function()
	attacking = event == 'PLAYER_ENTER_COMBAT'
end)

SLASH_ATTACK1 = '/attack'
function SlashCmdList.ATTACK(command)
	if not attacking then
		CastSpellByName'Attack'
	end
end

f:SetScript('OnUpdate', function()
	f:SetScript('OnUpdate', nil)
	for i = 1, GetNumMacros() do
		if GetMacroInfo(i) == 'attack' then
			EditMacro(i, 'attack', 43, '/attack', 1)
			return
		end
	end
	CreateMacro('attack', 43, '/attack', 1)
end)