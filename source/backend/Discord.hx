package backend;

import Sys.sleep;
import discord_rpc.DiscordRpc;
import lime.app.Application;

class DiscordClient
{
	public static var isInitialized:Bool = false;
	private static var _defaultID:String = "1197604274914463835";
	public static var clientID(default, set):String = _defaultID;

	private static var _options:DiscordPresenceOptions = {
		details: "In the Menus",
		state: null,
		largeImageKey: 'logo',
		largeImageText: "Psych Engine",
		smallImageKey : null,
		startTimestamp : null,
		endTimestamp : null,
		spectateSecret: null, // this one doesn't work im not doing super advanced stuff 
	};

	// i mean it's kinda cool
	private static var funnyTexts:Array<String> = [
		'The Mod Where Everything Gets REPLACED',
		'Imagine Taking 2 Years For An Update??',
		'Version 1.5',
		'Pibber',
		'Werid, Must Be A Pibby Glitch',
		'This Is A Text The Game Randomly Choosed',
		'The Mod Became Good Trust Me',
		'Insert Scary Text',
		'Insert Goofy Text',
		'0 Divided By 0',
		'I Hate Pibby From FNF',
		'Glitched Legends But Good',
		'How Does The Turkey Smell?',
		'Steamboat Full Of RATS',
		'Hello, Is This Patrick?',
		'Yeah'
	];

	public function new()
	{
		trace("Discord Client starting...");
		DiscordRpc.start({
			clientID: clientID,
			onReady: onReady,
			onError: onError,
			onDisconnected: onDisconnected,
			onSpectate: (thing) -> thing = 'https://gamebanana.com/mods/344757'
		});
		trace("Discord Client started.");

		var localID:String = clientID;
		while (localID == clientID)
		{
			DiscordRpc.process();
			sleep(2);
			//trace('Discord Client Update $localID');
		}

		//DiscordRpc.shutdown();
	}

	public static function check()
	{
		if(!ClientPrefs.data.discordRPC)
		{
			if(isInitialized) shutdown();
			isInitialized = false;
		}
		else start();
	}
	
	public static function start()
	{
		if (!isInitialized && ClientPrefs.data.discordRPC) {
			initialize();
			Application.current.window.onClose.add(function() {
				shutdown();
			});
		}
	}

	public static function shutdown()
	{
		DiscordRpc.shutdown();
	}
	
	static function onReady()
	{
		DiscordRpc.presence(_options);
	}

	private static function set_clientID(newID:String)
	{
		var change:Bool = (clientID != newID);
		clientID = newID;

		if(change && isInitialized)
		{
			shutdown();
			isInitialized = false;
			start();
			DiscordRpc.process();
		}
		return newID;
	}

	static function onError(_code:Int, _message:String)
	{
		trace('Error! $_code : $_message');
	}

	static function onDisconnected(_code:Int, _message:String)
	{
		trace('Disconnected! $_code : $_message');
	}

	public static function initialize()
	{
		
		var DiscordDaemon = sys.thread.Thread.create(() ->
		{
			new DiscordClient();
		});
		trace("Discord Client initialized");
		isInitialized = true;
	}

	public static function changePresence(details:String, state:Null<String>, ?smallImageKey : String, ?hasStartTimestamp : Bool, ?endTimestamp: Float)
	{
		var startTimestamp:Float = 0;
		if (hasStartTimestamp) startTimestamp = Date.now().getTime();
		if (endTimestamp > 0) endTimestamp = startTimestamp + endTimestamp;

		_options.details = details;
		_options.state = state;
		_options.largeImageKey = 'logo';
		_options.largeImageText = funnyTexts[FlxG.random.int(0, funnyTexts.length - 1)];
		_options.smallImageKey = smallImageKey;
		// Obtained times are in milliseconds so they are divided so Discord can use it
		_options.startTimestamp = Std.int(startTimestamp / 1000);
		_options.endTimestamp = Std.int(endTimestamp / 1000);
		DiscordRpc.presence(_options);

		//trace('Discord RPC Updated. Arguments: $details, $state, $smallImageKey, $hasStartTimestamp, $endTimestamp');
	}
	
	public static function resetClientID()
		clientID = _defaultID;

	#if MODS_ALLOWED
	public static function loadModRPC()
	{
		var pack:Dynamic = Mods.getPack();
		if(pack != null && pack.discordRPC != null && pack.discordRPC != clientID)
		{
			clientID = pack.discordRPC;
			//trace('Changing clientID! $clientID, $_defaultID');
		}
	}
	#end

	#if LUA_ALLOWED
	public static function addLuaCallbacks(lua:State) {
		Lua_helper.add_callback(lua, "changeDiscordPresence", function(details:String, state:Null<String>, ?smallImageKey:String, ?hasStartTimestamp:Bool, ?endTimestamp:Float) {
			changePresence(details, state, smallImageKey, hasStartTimestamp, endTimestamp);
		});

		Lua_helper.add_callback(lua, "changeDiscordClientID", function(?newID:String = null) {
			if(newID == null) newID = _defaultID;
			clientID = newID;
		});
	}
	#end
}
