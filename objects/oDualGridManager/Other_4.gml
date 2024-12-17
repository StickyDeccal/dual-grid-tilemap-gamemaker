/// @desc refresh display on room start
if(layer_exists(layer_get_id(placeholderTilemapString)) and layer_exists(layer_get_id(displayTilemapString)))
{
	displayTilemap = layer_tilemap_get_id(layer_get_id(displayTilemapString))
	placeholderTilemap = layer_tilemap_get_id(layer_get_id(placeholderTilemapString))
	var CellsHorizontal = room_width/TILESIZE;
	var CellsVertical = room_height/TILESIZE;
	var tileOff = -TILESIZE/2;
	for (var i = 1; i < CellsHorizontal; i++) 
	{
		for (var j = 1; j < CellsVertical; j++) 
		{
			var pos = [i*TILESIZE, j*TILESIZE];
			setDisplayTile(pos);
		}
	}
	layer_x(layer_get_id(displayTilemapString),tileOff);
	layer_y(layer_get_id(displayTilemapString),tileOff);
	layer_set_visible(layer_get_id(placeholderTilemapString),false);
}