//Q4 - Assume all method calls work fine. Fix the memory leak issue in below method



//In this problem I deleted all allocated memory of the player objects to ensure there was no memory leaks. 
//I likewise did so for the allocated space of the item, if it was successfully found/created.
//WM 5/7/24
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
  Player* player = g_game.getPlayerByName(recipient);
  if (!player) 
  {
    player = new Player(nullptr);
    if (!IOLoginData::loadPlayerByName(player, recipient)) 
    {
      delete player;  //wm 5/7/24
      return;
    }
  }

  Item* item = Item::CreateItem(itemId);
  if (!item) 
  {
    delete player;  //wm 5/7/24
    return;
  }

  g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

  if (player->isOffline()) 
  {
    IOLoginData::savePlayer(player);
  }

  delete item;    //wm 5/7/24
  delete player;  //wm 5/7/24
  return;
}
