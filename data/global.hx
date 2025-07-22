import funkin.backend.assets.ModsFolder;
import sys.io.File;
import funkin.backend.utils.WindowUtils;
import lime.graphics.Image;
import openfl.system.Capabilities;
import funkin.backend.system.framerate.Framerate;
import funkin.backend.system.framerate.CodenameBuildField;
import funkin.backend.system.Main;

static var redirectStates:Map<FlxState, String> = [
    MainMenuState => "menus/exeMainMenu",
    StoryMenuState => "menus/exeStoryMenu"
    TitleState => "menus/exeTitle"
];
static var windowTitle:String = "Friday Night Funkin' - Codename Engine: Vs. Sonic.EXE";
// 
var relaserVar:String = Main.releaseCycle;
function postStateSwitch() {
	//set commit id to mod name
	if(Main.releaseCycle == null) relaserVar = '';
	Framerate.codenameBuildField.text = 'Codename Engine '+ relaserVar +' \nVs: Sonic.EXE';
	
	// resetTitle
	WindowUtils.resetTitle();
	// title
	window.title = windowTitle;
	// bgColor
	FlxG.camera.bgColor = 0xFF000000;
	//icon window
	window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('icon'))));

}
function preStateSwitch() {
    for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}
function new() {
    if (FlxG.save.data.kadeUI == null) FlxG.save.data.kadeUI = false;
    if (FlxG.save.data.fastPress == null) FlxG.save.data.fastPress = false;
    if (FlxG.save.data.gore == null) FlxG.save.data.gore = true;

    if (FlxG.save.data.oldLogo == null) FlxG.save.data.oldLogo = false;
}