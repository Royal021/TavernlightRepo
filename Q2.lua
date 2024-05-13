--original
function printSmallGuildNames(memberCount)
  -- this method is supposed to print names of all guilds that have less than memberCount max members
  local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
  local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
  local guildName = result.getString("name")
  print(guildName)
end

--[[
In the original example there was unitialized data in result vs using resultId, that was corrected
The other problem was the getString was only called once rather than gettting "all guilds", that was corrected with a loop through all returned rows
Then the print was done everyline, and after the result was freed. where this was stored local it may not be a problem but it felt practice.

If getString gets all column names then the loops could be removed. This was a mash up of using a fetch with the nextRow of the resultID.

There is also a best practice require db, but since it is global I know you all did that.
]]
--

--begin code WM 5/7/24
function printSmallGuildNames(memberCount)
  --[[
  @brief this method is supposed to print names of all guilds that have less than memberCount max members
  @params memberCount : an integer number of max members you wish to query
  @returns nil
  WM 5/7/24
  ]]
  --
  --optional require on db ,https://www.tutorialspoint.com/lua/lua_database_access.htm

  local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
  local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
  if resultId then
    --cycle all results
    while db.nextRow(resultId) do
      local guildName = db.getString(resultId, "name")
      print(guildName)
    end
    db.freeResult(resultId)
  else
    --no guilds with sizes smaller than memberCount
    print("no guilds with sizes smaller than" .. memberCount)
  end
end
