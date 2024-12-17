/// @desc set vars
#macro TILESIZE 32
placeholderTilemapString = "PlaceholderTiles";
displayTilemapString = "DisplayTiles";
global.refreshTilemap = false; //global for easy access

//enumarate from bottom to top layer
enum TileType {
	None,
	Water,
	Dirt,
	Grass,
	PavedGrass
}


//into flat string
neighboursToTile = ds_map_create();
//dirt+none
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.None)	+string(TileType.None)	, [0,0]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.None)	+string(TileType.Dirt)	, [1,0]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.None)	, [2,0]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.None)	+string(TileType.None)	+string(TileType.None)	, [3,0]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.Dirt)	+string(TileType.None)	, [0,1]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Dirt)	+string(TileType.None)	+string(TileType.Dirt)	, [1,1]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.None)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [2,1]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [3,1]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.None)	+string(TileType.None)	+string(TileType.Dirt)	, [0,2]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [1,2]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [2,2]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.None)	, [3,2]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Dirt)	+string(TileType.None)	+string(TileType.None)	, [0,3]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.None)	+string(TileType.None)	, [1,3]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.None)	+string(TileType.Dirt)	, [2,3]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.None)	+string(TileType.Dirt)	+string(TileType.None)	, [3,3]);
//dirt+water
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	, [4,0]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Dirt)	, [5,0]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Water)	, [6,0]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	, [7,0]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Dirt)	+string(TileType.Water)	, [4,1]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Dirt)	+string(TileType.Water)	+string(TileType.Dirt)	, [5,1]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Water)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [6,1]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [7,1]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Dirt)	, [4,2]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [5,2]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [6,2]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Water)	, [7,2]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Dirt)	+string(TileType.Water)	+string(TileType.Water)	, [4,3]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Water)	+string(TileType.Water)	, [5,3]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Water)	+string(TileType.Dirt)	, [6,3]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Water)	+string(TileType.Dirt)	+string(TileType.Water)	, [7,3]);
//grass+none
//ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.None)	+string(TileType.None)	, [0,0]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.None)	+string(TileType.Grass)	, [1,4]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.None)	, [2,4]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.None)	+string(TileType.None)	+string(TileType.None)	, [3,4]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.Grass)	+string(TileType.None)	, [0,5]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Grass)	+string(TileType.None)	+string(TileType.Grass)	, [1,5]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.None)	+string(TileType.Grass)	+string(TileType.Grass)	, [2,5]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.Grass)	+string(TileType.Grass)	, [3,5]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.None)	+string(TileType.None)	+string(TileType.Grass)	, [0,6]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	, [1,6]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	, [2,6]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.None)	, [3,6]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Grass)	+string(TileType.None)	+string(TileType.None)	, [0,7]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.None)	+string(TileType.None)	, [1,7]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.None)	+string(TileType.Grass)	, [2,7]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.None)	+string(TileType.Grass)	+string(TileType.None)	, [3,7]);
//grass+dirt
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [4,4]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Grass)	, [5,4]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Dirt)	, [6,4]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [7,4]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Grass)	+string(TileType.Dirt)	, [4,5]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Grass)	+string(TileType.Dirt)	+string(TileType.Grass)	, [5,5]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Dirt)	+string(TileType.Grass)	+string(TileType.Grass)	, [6,5]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Grass)	+string(TileType.Grass)	, [7,5]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Dirt)	+string(TileType.Dirt)	+string(TileType.Grass)	, [4,6]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	, [5,6]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	, [6,6]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Dirt)	, [7,6]);
ds_map_add(neighboursToTile, string(TileType.Dirt)	+string(TileType.Grass)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [4,7]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Dirt)	+string(TileType.Dirt)	, [5,7]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Dirt)	+string(TileType.Grass)	, [6,7]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Dirt)	+string(TileType.Grass)	+string(TileType.Dirt)	, [7,7]);
//grass+water
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	, [8,4]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Grass)	, [9,4]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Water)	, [10,4]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	, [11,4]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Grass)	+string(TileType.Water)	, [8,5]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Grass)	+string(TileType.Water)	+string(TileType.Grass)	, [9,5]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Water)	+string(TileType.Grass)	+string(TileType.Grass)	, [10,5]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Grass)	+string(TileType.Grass)	, [11,5]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Grass)	, [8,6]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	, [9,6]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	, [10,6]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Water)	, [11,6]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Grass)	+string(TileType.Water)	+string(TileType.Water)	, [8,7]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Water)	+string(TileType.Water)	, [9,7]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Grass)	+string(TileType.Water)	+string(TileType.Grass)	, [10,7]);
ds_map_add(neighboursToTile, string(TileType.Grass)	+string(TileType.Water)	+string(TileType.Grass)	+string(TileType.Water)	, [11,7]);
//pavedGrass+none
//ds_map_add(neighboursToTile, string(TileType.None)			+string(TileType.None)			+string(TileType.None)			+string(TileType.None)			, [0,8]);
ds_map_add(neighboursToTile, string(TileType.None)			+string(TileType.None)			+string(TileType.None)			+string(TileType.PavedGrass)	, [1,8]);
ds_map_add(neighboursToTile, string(TileType.None)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.None)			, [2,8]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.None)			+string(TileType.None)			+string(TileType.None)			, [3,8]);
ds_map_add(neighboursToTile, string(TileType.None)			+string(TileType.None)			+string(TileType.PavedGrass)	+string(TileType.None)			, [0,9]);
ds_map_add(neighboursToTile, string(TileType.None)			+string(TileType.PavedGrass)	+string(TileType.None)			+string(TileType.PavedGrass)	, [1,9]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.None)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [2,9]);
ds_map_add(neighboursToTile, string(TileType.None)			+string(TileType.None)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [3,9]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.None)			+string(TileType.None)			+string(TileType.PavedGrass)	, [0,10]);
ds_map_add(neighboursToTile, string(TileType.None)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [1,10]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [2,10]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.None)			, [3,10]);
ds_map_add(neighboursToTile, string(TileType.None)			+string(TileType.PavedGrass)	+string(TileType.None)			+string(TileType.None)			, [0,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.None)			+string(TileType.None)			, [1,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.None)			+string(TileType.PavedGrass)	, [2,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.None)			+string(TileType.PavedGrass)	+string(TileType.None)			, [3,11]);
//pavedGrass+grass
ds_map_add(neighboursToTile, string(TileType.Grass)			+string(TileType.Grass)			+string(TileType.Grass)			+string(TileType.Grass)			, [4,8]);
ds_map_add(neighboursToTile, string(TileType.Grass)			+string(TileType.Grass)			+string(TileType.Grass)			+string(TileType.PavedGrass)	, [5,8]);
ds_map_add(neighboursToTile, string(TileType.Grass)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Grass)			, [6,8]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Grass)			+string(TileType.Grass)			+string(TileType.Grass)			, [7,8]);
ds_map_add(neighboursToTile, string(TileType.Grass)			+string(TileType.Grass)			+string(TileType.PavedGrass)	+string(TileType.Grass)			, [4,9]);
ds_map_add(neighboursToTile, string(TileType.Grass)			+string(TileType.PavedGrass)	+string(TileType.Grass)			+string(TileType.PavedGrass)	, [5,9]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Grass)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [6,9]);
ds_map_add(neighboursToTile, string(TileType.Grass)			+string(TileType.Grass)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [7,9]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Grass)			+string(TileType.Grass)			+string(TileType.PavedGrass)	, [4,10]);
ds_map_add(neighboursToTile, string(TileType.Grass)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [5,10]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [6,10]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Grass)			, [7,10]);
ds_map_add(neighboursToTile, string(TileType.Grass)			+string(TileType.PavedGrass)	+string(TileType.Grass)			+string(TileType.Grass)			, [4,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Grass)			+string(TileType.Grass)			, [5,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Grass)			+string(TileType.PavedGrass)	, [6,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Grass)			+string(TileType.PavedGrass)	+string(TileType.Grass)			, [7,11]);
//pavedGrass+dirt
ds_map_add(neighboursToTile, string(TileType.Dirt)			+string(TileType.Dirt)			+string(TileType.Dirt)			+string(TileType.Dirt)			, [8,8]);
ds_map_add(neighboursToTile, string(TileType.Dirt)			+string(TileType.Dirt)			+string(TileType.Dirt)			+string(TileType.PavedGrass)	, [9,8]);
ds_map_add(neighboursToTile, string(TileType.Dirt)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Dirt)			, [10,8]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Dirt)			+string(TileType.Dirt)			+string(TileType.Dirt)			, [11,8]);
ds_map_add(neighboursToTile, string(TileType.Dirt)			+string(TileType.Dirt)			+string(TileType.PavedGrass)	+string(TileType.Dirt)			, [8,9]);
ds_map_add(neighboursToTile, string(TileType.Dirt)			+string(TileType.PavedGrass)	+string(TileType.Dirt)			+string(TileType.PavedGrass)	, [9,9]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Dirt)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [10,9]);
ds_map_add(neighboursToTile, string(TileType.Dirt)			+string(TileType.Dirt)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [11,9]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Dirt)			+string(TileType.Dirt)			+string(TileType.PavedGrass)	, [8,10]);
ds_map_add(neighboursToTile, string(TileType.Dirt)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [9,10]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [10,10]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Dirt)			, [11,10]);
ds_map_add(neighboursToTile, string(TileType.Dirt)			+string(TileType.PavedGrass)	+string(TileType.Dirt)			+string(TileType.Dirt)			, [8,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Dirt)			+string(TileType.Dirt)			, [9,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Dirt)			+string(TileType.PavedGrass)	, [10,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Dirt)			+string(TileType.PavedGrass)	+string(TileType.Dirt)			, [11,11]);
//pavedGrass+water
ds_map_add(neighboursToTile, string(TileType.Water)			+string(TileType.Water)			+string(TileType.Water)			+string(TileType.Water)			, [12,8]);
ds_map_add(neighboursToTile, string(TileType.Water)			+string(TileType.Water)			+string(TileType.Water)			+string(TileType.PavedGrass)	, [13,8]);
ds_map_add(neighboursToTile, string(TileType.Water)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Water)			, [14,8]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Water)			+string(TileType.Water)			+string(TileType.Water)			, [15,8]);
ds_map_add(neighboursToTile, string(TileType.Water)			+string(TileType.Water)			+string(TileType.PavedGrass)	+string(TileType.Water)			, [12,9]);
ds_map_add(neighboursToTile, string(TileType.Water)			+string(TileType.PavedGrass)	+string(TileType.Water)			+string(TileType.PavedGrass)	, [13,9]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Water)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [14,9]);
ds_map_add(neighboursToTile, string(TileType.Water)			+string(TileType.Water)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [15,9]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Water)			+string(TileType.Water)			+string(TileType.PavedGrass)	, [12,10]);
ds_map_add(neighboursToTile, string(TileType.Water)			+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [13,10]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	, [14,10]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Water)			, [15,10]);
ds_map_add(neighboursToTile, string(TileType.Water)			+string(TileType.PavedGrass)	+string(TileType.Water)			+string(TileType.Water)			, [12,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Water)			+string(TileType.Water)			, [13,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.PavedGrass)	+string(TileType.Water)			+string(TileType.PavedGrass)	, [14,11]);
ds_map_add(neighboursToTile, string(TileType.PavedGrass)	+string(TileType.Water)			+string(TileType.PavedGrass)	+string(TileType.Water)			, [15,11]);
//water+none
//ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.None)	+string(TileType.None)	, [0,12]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.None)	+string(TileType.Water)	, [1,12]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.None)	, [2,12]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.None)	+string(TileType.None)	+string(TileType.None)	, [3,12]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.Water)	+string(TileType.None)	, [0,13]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Water)	+string(TileType.None)	+string(TileType.Water)	, [1,13]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.None)	+string(TileType.Water)	+string(TileType.Water)	, [2,13]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.None)	+string(TileType.Water)	+string(TileType.Water)	, [3,13]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.None)	+string(TileType.None)	+string(TileType.Water)	, [0,14]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	, [1,14]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	, [2,14]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.Water)	+string(TileType.None)	, [3,14]);
ds_map_add(neighboursToTile, string(TileType.None)	+string(TileType.Water)	+string(TileType.None)	+string(TileType.None)	, [0,15]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.None)	+string(TileType.None)	, [1,15]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.Water)	+string(TileType.None)	+string(TileType.Water)	, [2,15]);
ds_map_add(neighboursToTile, string(TileType.Water)	+string(TileType.None)	+string(TileType.Water)	+string(TileType.None)	, [3,15]);