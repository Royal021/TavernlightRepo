--original
local function releaseStorage(player)
  player:setStorageValue(1000, -1)
end

function onLogout(player)
  if player:getStorageValue(1000) == 1 then
    addEvent(releaseStorage, 1000, player)
  end
  return true
end

--[[
Since I already am using the onLogout function globally, I will just perform releaseStorage operations in it. This should reduce overall memory usage.
I would also move the return inside the if statement, that way a nil is returned if the function is unsuccessful for x,y,z reason.

If there is a game feel or other reason for the 1 second delay for logout Event and/or releaseStorage is used in other functions in this scope, I would use the previous implementation.

If the releaseStorage function is used outside this file then removing the local and making it a global function is necessary.
]]
   --

--Begin WM code 5/6/24
function onLogout(player)
  --[[
  @brief sets storage value 1000 to -1 if player is logged in
  @params player : a player class object
  @returns true if successful, false if not
  WM code 5/6/24
  ]]
     --
  if player:getStorageValue(1000) == 1 then
    player:setStorageValue(1000, -1)
    return true;
  end;
end;
