// Get the tile type at a given coordinate
function getPlaceholderTileTypeAt(coords) {
	var tile = tilemap_get_at_pixel(placeholderTilemap,coords[0],coords[1]);
	return tile
}

// Calculate which tile should be used based on neighboring tiles
function calculateDisplayTile(coords) {
	var tileOff = TILESIZE/2;
	var topLeft = getPlaceholderTileTypeAt([coords[0] - tileOff, coords[1] - tileOff]);
	var topRight = getPlaceholderTileTypeAt([coords[0] + tileOff, coords[1] - tileOff]);
	var botLeft = getPlaceholderTileTypeAt([coords[0] - tileOff, coords[1] + tileOff]);
	var botRight = getPlaceholderTileTypeAt([coords[0] + tileOff, coords[1] + tileOff]);
	
	var neighbours = string(topLeft)+string(topRight)+string(botLeft)+string(botRight);
	if (ds_map_exists(neighboursToTile, neighbours)) {
		return neighboursToTile[? neighbours];
	} else return drawQuarterTiles(topLeft,topRight,botLeft,botRight,coords); // bottom tile if not found
}

function drawQuarterTiles(tL,tR,bL,bR,pos){//in case the required tileType doesn't exist
var sortMe = [tL,tR,bL,bR];
array_sort(sortMe,true);
var tileOff = -TILESIZE/2;
if(layer_exists(layer_get_id("QuarterTile1"))) 
{
	var q1 = layer_get_id("QuarterTile1");
} else {
	var q1 = layer_create(layer_get_depth(layer_get_id("DisplayTiles")) - 1,"QuarterTile1");
	layer_tilemap_create(q1,0,0,t16Display,room_width/TILESIZE,room_height/TILESIZE);
}
layer_x(q1,0);
layer_y(q1,0);
if(layer_exists(layer_get_id("QuarterTile2"))) 
{
	var q2 = layer_get_id("QuarterTile2");
} else {
	var q2 = layer_create(layer_get_depth(layer_get_id("DisplayTiles")) - 2,"QuarterTile2");
	layer_tilemap_create(q2,0,0,t16Display,room_width/TILESIZE,room_height/TILESIZE);
}
layer_x(q2,0);
layer_y(q2,0);
if(layer_exists(layer_get_id("QuarterTile3"))) 
{
	var q3 = layer_get_id("QuarterTile3");
} else {
	var q3 = layer_create(layer_get_depth(layer_get_id("DisplayTiles")) - 3,"QuarterTile3");
	layer_tilemap_create(q3,0,0,t16Display,room_width/TILESIZE,room_height/TILESIZE);
}
layer_x(q3,0);
layer_y(q3,0);
var tLt = undefined;
var tRt = undefined;
var bLt = undefined;
var bRt = undefined;
for(var i = 1; i < 4; ++i)
{
	if(sortMe[i] == tL and is_undefined(tLt))
	{
		tLt = string(tL)+string(TileType.None)+string(TileType.None)+string(TileType.None);
		var tPos = neighboursToTile[? tLt];
		var tData = tPos[0] + tPos[1]*16;
		if(i = 1) var l = q1; else if(i = 2) var l = q2; else if(i = 3) var l = q3;
		tilemap_set_at_pixel(layer_tilemap_get_id(l),tData,pos[0]+1,pos[1]+1);
	} else if(sortMe[i] == tR and is_undefined(tRt)) {
		tRt = string(TileType.None)+string(tR)+string(TileType.None)+string(TileType.None);
		var tPos = neighboursToTile[? tRt];
		var tData = tPos[0] + tPos[1]*16;
		if(i = 1) var l = q1; else if(i = 2) var l = q2; else if(i = 3) var l = q3;
		tilemap_set_at_pixel(layer_tilemap_get_id(l),tData,pos[0]+1,pos[1]+1);
	} else if(sortMe[i] == bL and is_undefined(bLt)) {
		bLt = string(TileType.None)+string(TileType.None)+string(bL)+string(TileType.None);
		var tPos = neighboursToTile[? bLt];
		var tData = tPos[0] + tPos[1]*16;
		if(i = 1) var l = q1; else if(i = 2) var l = q2; else if(i = 3) var l = q3;
		tilemap_set_at_pixel(layer_tilemap_get_id(l),tData,pos[0]+1,pos[1]+1);
	} else if(sortMe[i] == bR and is_undefined(bRt)) {
		bRt = string(TileType.None)+string(TileType.None)+string(TileType.None)+string(bR);
		var tPos = neighboursToTile[? bRt];
		var tData = tPos[0] + tPos[1]*16;
		if(i = 1) var l = q1; else if(i = 2) var l = q2; else if(i = 3) var l = q3;
		tilemap_set_at_pixel(layer_tilemap_get_id(l),tData,pos[0]+1,pos[1]+1);
		
		show_debug_message("Attempting to log missing tile at: (" + string(pos[0]) + ", " + string(pos[1]) + ")");
	}
}


layer_x(q1,tileOff);
layer_y(q1,tileOff);
layer_x(q2,tileOff);
layer_y(q2,tileOff);
layer_x(q3,tileOff);
layer_y(q3,tileOff);
var bottom = string(sortMe[0])+string(sortMe[0])+string(sortMe[0])+string(sortMe[0]);
return neighboursToTile[? bottom];
}

// Update the display tilemap based on the placeholder tilemap
function setDisplayTile(pos) {
	var tilePos = calculateDisplayTile(pos);
	var tileData = tilePos[0] + tilePos[1]*16;
	tilemap_set_at_pixel(displayTilemap,tileData,pos[0]+1,pos[1]+1)

	 
}