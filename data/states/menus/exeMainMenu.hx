import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;

var itemList:Array<String> = [
	'story_mode'
	'freeplay',
	'options',
];
var itemOffsets_start:Array<Float> = [760, 35];
var itemOffsets_each:Array<Float> = [40, 140];
var itemAccept:Array<Void->Void> = [
	() -> switchStateWithDelay(0.85, new StoryMenuState()),
	() -> switchStateWithDelay(0.85, new FreeplayState()),
	() -> switchStateWithDelay(0.85, new OptionsMenu()),
];
var isSelected:Bool = false;
var curSelected:Int = 0;
var itemGroup:FlxSpriteGroup;

function create(){
	Conductor.bpm = 90;

	bg = new FlxSprite();
	bg.frames = Paths.getFrames('menus/mainMenu/v3/Main_Menu_Spritesheet_Animation');
	bg.animation.addByPrefix('idle', 'BG', 24);
	bg.animation.play('idle');
	bg.screenCenter();
	add(bg);

	itemGroup = new FlxSpriteGroup();
	for (i in 0...itemList.length) {
		var option = itemList[i];
		var item = new FlxSprite(itemOffsets_start[0], itemOffsets_start[1]);
		item.frames = Paths.getFrames('menus/mainMenu/v3/items/' + option);
		item.animation.addByPrefix('idle', option + ' basic', 0);
		item.animation.addByPrefix('selected', option + ' white', 0);
		item.animation.play('idle');
		item.ID = i;
		itemGroup.add(item);

		for (i in 0...2)
			itemOffsets_start[i] += itemOffsets_each[i];
	}
	add(itemGroup);

	changeSelection(0, true);
}

function update(elapsed){
	if(controls.SWITCHMOD){
		if(FlxG.state.subState == null)
			openSubState(new ModSwitchMenu());
		else
			FlxG.state.closeSubState();
	}

	if(FlxG.keys.justPressed.SEVEN){
		if(FlxG.state.subState == null)
			openSubState(new EditorPicker());
		else
			FlxG.state.closeSubState();
	}

	if(FlxG.state.subState == null){
		if(!isSelected){
			if(controls.ACCEPT) accept();
			else if(controls.BACK) back();

			changeSelection((controls.UP_P ? -1 : 0) + (controls.DOWN_P ? 1 : 0));
		}
	}
}

function changeSelection(change:Int, force:Bool = false) {
	if (!force) {
		if (change != 0) FlxG.sound.play(Paths.sound('menu/scroll'));
		else return;
	}

	curSelected += change;
	if (curSelected < 0) curSelected = itemList.length - 1;
	if (curSelected >= itemList.length) curSelected = 0;

	itemGroup.forEach(item -> {
		item.animation.play(item.ID == curSelected ? 'selected' : 'idle');
	});
}

function accept() {
	isSelected = true;
	FlxG.sound.play(Paths.sound('menu/confirm'));

	itemAccept[curSelected]();
}

function back() {
	isSelected = true;
	FlxG.sound.play(Paths.sound('menu/cancel'));

	switchStateWithDelay(0.25, new TitleState());
}

function switchStateWithDelay(delay, state) {
	return new FlxTimer().start(delay, () -> FlxG.switchState(state));
}