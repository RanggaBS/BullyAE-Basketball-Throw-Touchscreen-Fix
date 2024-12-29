function main()
	while not SystemIsReady() do
		Wait(0)
	end

	-- ------------------------------------------------------------------------- --
	-- Setup                                                                     --
	-- ------------------------------------------------------------------------- --

	local actionNodes = {
		"/Global/Basketball/Basketball/Actions/Bball_Hoop/Near",
		"/Global/Basketball/Basketball/Actions/Bball_Hoop/Far",
	}
	local actFile = "Act/Weapons/Basketball.act"
	local nodeCount = table.getn(actionNodes)

	local BASKETBALL1_ID = 334
	local BASKETBALL2_ID = 381

	local CROUCH_BUTTON_ID = 15
	local PLAYER1_CONTROLLER_ID = 0

	---@return boolean
	local function IsFree()
		return PedMePlaying(gPlayer, "Default_KEY")
			and not PedIsValid(PedGetTargetPed(gPlayer))
	end

	---@return boolean
	local function HasBasketball()
		return WeaponEquipped(BASKETBALL1_ID) or WeaponEquipped(BASKETBALL2_ID)
	end

	---@return boolean
	local function IsHopping()
		return PedIsPlaying(gPlayer, actionNodes[1], true)
			or PedIsPlaying(gPlayer, actionNodes[2], true)
	end

	-- ------------------------------------------------------------------------- --
	-- Main Loop                                                                 --
	-- ------------------------------------------------------------------------- --

	while true do
		Wait(0)

		if
			PlayerGetUsingTouchScreen()
			and IsFree()
			and HasBasketball()
			and not IsHopping()
			and IsButtonBeingPressed(CROUCH_BUTTON_ID, PLAYER1_CONTROLLER_ID)
		then
			local randomIndex = math.random(nodeCount)
			local actionNode = actionNodes[randomIndex]
			PedSetActionNode(gPlayer, actionNode, actFile)
		end
	end
end
