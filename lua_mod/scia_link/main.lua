-- Register the mod with the game engine
local mod = RegisterMod("Sc IA Link", 1)

-- Print a message to the debug console on load
Isaac.DebugString("Sc IA Link loaded successfully")
print("Sc IA Link loaded successfully")
print("youhou")


local function safeKeyboardTriggered(key, controllerIndex)
    return Input.IsButtonTriggered(key, controllerIndex) and not Input.IsButtonTriggered(key % 32, controllerIndex)
end


function mod:OnPeffectUpdate(player)
    --print(Keyboard.KEY_SPACE, Input.IsButtonTriggered(Keyboard.KEY_SPACE, player.ControllerIndex))
    if safeKeyboardTriggered(Keyboard.KEY_SPACE, player.ControllerIndex) then
        print("Space key pressed!")

        -- Spawn a full red heart at the player's position
        Isaac.Spawn(
            EntityType.ENTITY_PICKUP,
            PickupVariant.PICKUP_HEART,
            HeartSubType.HEART_FULL,
            player.Position,
            Vector.Zero,
            nil
        )
    end
end

mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, mod.OnPeffectUpdate)


