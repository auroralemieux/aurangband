# aurangband


DUNGEON
- belongs to a game
- is an array
- has a floor
- has a wall

FLOOR
- belongs to a dungeon
- is a map element
- has an items inventory
- has a creature inventory
- can be occupied or not occupied

WALL
- belongs to a dungeon
- is a map element
- can be turned into a floor tile by a player digging into it

PLAYER
- is a player
- belongs to a game
- has an items inventory
- can move from one floor tile to another
- can dig
- can pick up an item
- can drop an item
- can view their inventory
- can talk to a monster

INVENTORY
- is a collection of things
- belongs to a player, a monster, or a floor tile
- can be added to (at last index)
- can be removed from (at any index)
- can be empty
- can contain player or monster, or item(s)

CREATURE INVENTORY < INVENTORY
- inherits from inventory
- belongs to a floor tile
- can contain max 1 player or monster
- can be empty or occupied

ITEM INVENTORY < INVENTORY
- inherits from inventory
- belongs to a player, monster, or floor tile
- can contain unlimited items
- can be empty or not empty
- 

ITEM
- is a thing
- belongs to an items inventory
- can be moved from one inventory to another

MONSTER
- is a monster
- belongs to a creature inventory
- has an items inventory
- can move
- can pick up items
- can drop items
- can talk to player
- can talk to other monsters
