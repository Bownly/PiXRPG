package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledImageTile;
import flixel.addons.editors.tiled.TiledLayer.TiledLayerType;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.editors.tiled.TiledTileSet;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import haxe.io.Path;

/**
 * @author Samuel Batista, Bownly
 */

class TiledLevel extends TiledMap
{
	// For each "Tile Layer" in the map, you must define a "tileset" property which contains the name of a tile sheet image 
	// used to draw tiles in that layer (without file extension). The image file must be located in the directory specified bellow.
	private inline static var c_PATH_LEVEL_TILESHEETS = "assets/images/tiles/";
	
	// Array of tilemaps used for collision
	public var foregroundTiles:FlxGroup;
	public var objectsLayer:FlxGroup;
	// public var backgroundLayer:FlxGroup;
	public var backgroundLayer:FlxTypedGroup<FlxTilemap>;
	public var foregroundLayer:FlxTypedGroup<FlxTilemap>;
	private var collidableTileLayers:Array<FlxTilemap>;
	public var collidableTileMap:FlxTilemap;
	
	// Sprites of images layers
	public var imagesLayer:FlxGroup;
	
	public function new(tiledLevel:Dynamic, state:TownState)
	{
		super(tiledLevel);
	
		state.width = width * 16 - 16;
		state.height = height * 16 - 16;

		imagesLayer = new FlxGroup();
		foregroundTiles = new FlxGroup();
		objectsLayer = new FlxGroup();
		// backgroundLayer = new FlxGroup();
		backgroundLayer = new FlxTypedGroup<FlxTilemap>();
		foregroundLayer = new FlxTypedGroup<FlxTilemap>();
		
		FlxG.camera.setScrollBoundsRect(0, 0, fullWidth, fullHeight, true);
		
		loadImages();

		// Load Tile Maps
		for (layer in layers)
		{
			if (layer.type == TiledLayerType.TILE)
			{
				var tileLayer:TiledTileLayer = cast layer;
				
				var tileSheetName:String = tileLayer.properties.get("tileset");
				
				if (tileSheetName == null)
					throw "'tileset' property not defined for the '" + tileLayer.name + "' layer. Please add the property to the layer.";
					
				var tileSet:TiledTileSet = null;

				for (ts in tilesets)
				{
					if (ts.name == tileSheetName)
					{
						tileSet = ts;
						break;
					}
				}
				
				if (tileSet == null)
					throw "Tileset '" + tileSheetName + " not found. Did you misspell the 'tilesheet' property in " + tileLayer.name + "' layer?";
					
				var imagePath 		= new Path(tileSet.imageSource);
				var processedPath 	= c_PATH_LEVEL_TILESHEETS + imagePath.file + "." + imagePath.ext;
				
				var tilemap:FlxTilemap = new FlxTilemap();
				tilemap.loadMapFromArray(tileLayer.tileArray, width, height, processedPath,
					tileSet.tileWidth, tileSet.tileHeight, OFF, tileSet.firstGID, 1, 1);
				tilemap.useScaleHack = false;
					
				if (tileLayer.properties.contains("collidable"))
				{
					collidableTileMap = tilemap;
					state.tileMap = tilemap;
				}

				if (tileLayer.name == "Encounters")
					state.encounterMap = tileLayer;

				if (tileLayer.properties.contains("overhead"))
					foregroundLayer.add(tilemap); 
				else
					backgroundLayer.add(tilemap); 

				if (tileLayer.properties.contains("edgeExitNextMapName"))
				{
					state.edgeExitNextMapName = tileLayer.properties.get("edgeExitNextMapName");
					state.edgeExitNextEntID = Std.parseInt(tileLayer.properties.get("edgeExitNextEntID"));
				}

			}
			else if (layer.type == TiledLayerType.OBJECT)
			{
				var tileLayer:TiledObjectLayer = cast layer;
				loadObjects(state);

			}
		}
	}
	
	public function loadObjects(state:TownState)
	{
		var layer:TiledObjectLayer;
		for (layer in layers)
		{
			if (layer.type != TiledLayerType.OBJECT)
				continue;
			var objectLayer:TiledObjectLayer = cast layer;
			
			//objects layer
			if (layer.name == "Objects")
			{
				for (o in objectLayer.objects)
				{
					loadObject(state, o, objectLayer, objectsLayer);
				}
			}
		}
	}
	
	private function loadImageObject(object:TiledObject)
	{
		var tilesImageCollection:TiledTileSet = this.getTileSet("imageCollection");
		var tileImagesSource:TiledImageTile = tilesImageCollection.getImageSourceByGid(object.gid);
		
		//decorative sprites
		var levelsDir:String = "assets/tiled/";
		
		var decoSprite:FlxSprite = new FlxSprite(0, 0, levelsDir + tileImagesSource.source);
		if (decoSprite.width != object.width || decoSprite.height != object.height)
		{
			decoSprite.antialiasing = true;
			decoSprite.setGraphicSize(object.width, object.height);
		}
		decoSprite.setPosition(object.x, object.y - decoSprite.height);
		decoSprite.origin.set(0, decoSprite.height);
		if (object.angle != 0)
		{
			decoSprite.angle = object.angle;
			decoSprite.antialiasing = true;
		}
		
		//Custom Properties
		if (object.properties.contains("depth"))
		{
			var depth = Std.parseFloat( object.properties.get("depth"));
			decoSprite.scrollFactor.set(depth,depth);
		}

		// backgroundLayer.add(decoSprite);
	}
	
	private function loadObject(state:TownState, o:TiledObject, g:TiledObjectLayer, group:FlxGroup)
	{
		var x:Int = o.x;
		var y:Int = o.y;
		
		// objects in tiled are aligned bottom-left (top-left in flixel)
		if (o.gid != -1)
			y -= g.map.getGidOwner(o.gid).tileHeight;
		
		switch (o.type.toLowerCase())
		{
			// case "start":
			// 	var player = new FlxSprite(x, y);
			// 	player.makeGraphic(32, 32, 0xffaa1111);
			// 	player.maxVelocity.x = 160;
			// 	player.maxVelocity.y = 400;
			// 	player.acceleration.y = 400;
			// 	player.drag.x = player.maxVelocity.x * 4;
			// 	FlxG.camera.follow(player);
			// 	state.player = player;
			// 	group.add(player);

			case "npc":
				for (npc in state.grpNPCs)
				{
					if (o.name == npc.name)
					{
						npc.x = x;
						npc.y = y;
					}
				}			
				
			case "entrance":
				// var entID = Std.parseInt(o.properties.get("name"))
				var entID = Std.parseInt(o.name);
				if (entID == state.entranceID)
				{
					state.player.x = x;
					state.player.y = y;
					var face:Int = 0;
					switch o.properties.get("playerfacing")
					{
						case "N": face = FlxObject.UP;
						case "S": face = FlxObject.DOWN;
						case "W": face = FlxObject.LEFT;
						case "E": face = FlxObject.RIGHT;
					}
					state.player.setFacing(face);					
				}

			case "exit":
				var exitID = Std.parseInt(o.name);
				var exit = new Exit(x, y, exitID, state.player, o.properties.get("nextlevel"), 
											Std.parseInt(o.properties.get("nextlevelentrance")));
				state.grpExits.add(exit);

		}
	}

	public function loadImages()
	{
		for (layer in layers)
		{
			if (layer.type != TiledLayerType.IMAGE)
				continue;

			var image:TiledImageLayer = cast layer;
			var sprite = new FlxSprite(image.x, image.y, c_PATH_LEVEL_TILESHEETS + image.imagePath);
			imagesLayer.add(sprite);
		}
	}
	
	public function collideWithLevel(obj:FlxObject, ?notifyCallback:FlxObject->FlxObject->Void, ?processCallback:FlxObject->FlxObject->Bool):Bool
	{
		if (collidableTileLayers == null)
			return false;

		for (map in collidableTileLayers)
		{
			// IMPORTANT: Always collide the map with objects, not the other way around. 
			//			  This prevents odd collision errors (collision separation code off by 1 px).
			if (FlxG.overlap(map, obj, notifyCallback, processCallback != null ? processCallback : FlxObject.separate))
			{
				return true;
			}
		}
		return false;
	}
}