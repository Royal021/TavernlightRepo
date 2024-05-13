--Q3 - Fix or improve the name and the implementation of the below method

function do_sth_with_PlayerParty(playerId, membername)
  player = Player(playerId)
  local party = player:getParty()

  for k, v in pairs(party:getMembers()) do
    if v == Player(membername) then
      party:removeMember(Player(membername))
    end
  end
end

--[[
The name was changed to match previous camel case conventions while also being more descriptive.
I adjusted the player object to be local in scope of the function.
I attempted to best practice the keys and values of the for loop using a more descriptive name for the value and using a _ for keys, showing it was not used
I added a break in the for loop to remove unneccessary iterations.

The tricky part with this one is the  "if v == Player(membername) then" part, this feels like you would create extra players in that scope which should be unneccessary, I feel best practice would be just adding a name getter in the player class.
]]
--

--begin code WM 5/7/24
function removePlayerFromParty(playerId, memberName)
  --[[
  @brief this method removes a given player with matching ID and Name from a party
  @params playerId : an integer ID of the player to remove
  @params playerName : a string name of the player to remove
  @returns nil
  WM 5/7/24
  ]]
  --
  local player = Player(playerId)
  local party = player:getParty()
  for _, partyMember in pairs(party:getMembers()) do
    if partyMember:getName() == memberName then
      party:removeMember(partyMember)
      break
    end
  end
end
