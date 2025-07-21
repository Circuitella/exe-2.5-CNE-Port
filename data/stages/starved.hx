import BGSprite;
import flixel.ui.FlxBarFillDirection;
import flixel.ui.FlxBar;
var fearNo:Float = 0;


var dadX:Float = 600;
var dadY:Float = 100;
var dadZoom:Float = 1;

var bfX:Float = 600;
var bfY:Float = 180;
var bfZoom:Float = 0.85;

var bfWX:Float = 50;
var bfWY:Flaot = 50;
var gfX:Float = -80;
var gfY:Float = 22;
var gfZoom:Float = 0.5;
var iconOffset:Float = 250;

var fearUi:FlxSprite;
var fearUiBg:FlxSprite;
var fearTween:FlxTween;
var fearTimer:FlxTimer;
var fearNo:Float = 0;
var fearBar:FlxBar;
var isFear:Bool = false;
var doFearCheck = false;
var fearNum:FlxText;

function create() {
    fearUi = new FlxSprite().loadGraphic(Paths.image('fearbar'));
    fearUi.scrollFactor.set();
    fearUi.screenCenter();
    fearUi.x += 578;
    fearUi.y -= 50;

    fearUiBg = new FlxSprite().loadGraphic(Paths.image('fearbarBG'));
    fearUiBg.scrollFactor.set();
    fearUiBg.screenCenter();
    fearUiBg.x += 580;
    fearUiBg.y -= 50;
    add(fearUiBg);

    fearBar = new FlxBar(0,0, FlxBarFillDirection.BOTTOM_TO_TOP, 33, 265, this, fearNo, 0, 100);
    fearBar.screenCenter();
    fearBar.x += 588;
    fearBar.y -= 50;
    fearBar.visible = true;
    fearBar.numDivisions = 1000;
    fearBar.createFilledBar(0x00000000, 0xFFFF0000);


    add(fearBar);
    add(fearUi);
}

function postCreate(){
        // fhjdslafhlsa dead hedgehogs

    /*———————————No hedgehogs?———————————
    ⠀⣞⢽⢪⢣⢣⢣⢫⡺⡵⣝⡮⣗⢷⢽⢽⢽⣮⡷⡽⣜⣜⢮⢺⣜⢷⢽⢝⡽⣝
    ⠸⡸⠜⠕⠕⠁⢁⢇⢏⢽⢺⣪⡳⡝⣎⣏⢯⢞⡿⣟⣷⣳⢯⡷⣽⢽⢯⣳⣫⠇
    ⠀⠀⢀⢀⢄⢬⢪⡪⡎⣆⡈⠚⠜⠕⠇⠗⠝⢕⢯⢫⣞⣯⣿⣻⡽⣏⢗⣗⠏⠀
    ⠀⠪⡪⡪⣪⢪⢺⢸⢢⢓⢆⢤⢀⠀⠀⠀⠀⠈⢊⢞⡾⣿⡯⣏⢮⠷⠁⠀⠀
    ⠀⠀⠀⠈⠊⠆⡃⠕⢕⢇⢇⢇⢇⢇⢏⢎⢎⢆⢄⠀⢑⣽⣿⢝⠲⠉⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⡿⠂⠠⠀⡇⢇⠕⢈⣀⠀⠁⠡⠣⡣⡫⣂⣿⠯⢪⠰⠂⠀⠀⠀⠀
    ⠀⠀⠀⠀⡦⡙⡂⢀⢤⢣⠣⡈⣾⡃⠠⠄⠀⡄⢱⣌⣶⢏⢊⠂⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⢝⡲⣜⡮⡏⢎⢌⢂⠙⠢⠐⢀⢘⢵⣽⣿⡿⠁⠁⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠨⣺⡺⡕⡕⡱⡑⡆⡕⡅⡕⡜⡼⢽⡻⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⣼⣳⣫⣾⣵⣗⡵⡱⡡⢣⢑⢕⢜⢕⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⣴⣿⣾⣿⣿⣿⡿⡽⡑⢌⠪⡢⡣⣣⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⡟⡾⣿⢿⢿⢵⣽⣾⣼⣘⢸⢸⣞⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠁⠇⠡⠩⡫⢿⣝⡻⡮⣒⢽⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    —————————————————————————————*/

    fearUiBg.cameras = [camHUD];
    fearBar.cameras = [camHUD];
    fearUi.cameras = [camHUD];


    defaultCamZoom = 0.85;
    burgerKingCities = new BGSprite('starved/city', -100, 0, 1, 0.9);
    burgerKingCities.setGraphicSize(Std.int(burgerKingCities.width * 1.5));
    add(burgerKingCities);

    mcdonaldTowers = new BGSprite('starved/towers', -100, 0, 1, 0.9);
    mcdonaldTowers.setGraphicSize(Std.int(mcdonaldTowers.width * 1.5));
    add(mcdonaldTowers);

    pizzaHutStage = new BGSprite('starved/stage', -100, 0, 1, 0.9);
    pizzaHutStage.setGraphicSize(Std.int(pizzaHutStage.width * 1.5));
    add(pizzaHutStage);

    // sonic died
    deadHedgehog = new BGSprite('starved/sonicisfuckingdead', 0, 100, 1, 0.9);
    deadHedgehog.setGraphicSize(Std.int(deadHedgehog.width * 0.65));
    deadHedgehog.isGore=true;
    add(deadHedgehog);

    // hes still dead

    wendysLight = new BGSprite('starved/light', 0, 0, 1, 0.9);
    wendysLight.setGraphicSize(Std.int(wendysLight.width * 1.2));

    remove(dad, true);
    remove(boyfriend, true);
    insert(99, dad);
    insert(99, boyfriend);
    boyfriend.y += 75;
    dad.x += 120;
    dad.y += 75;


    healthBar.angle += 90;
    healthBar.screenCenter();
    healthBar.x -= 500;
    healthBarBG.angle += 90;
    healthBarBG.screenCenter();
    healthBarBG.x = healthBar.x - 5;
    
    iconP1.x += 1050;
    iconP2.x += 1050;



    healthBar.alpha = 0.75;
    healthBarBG.alpha = 0.75;
    missesTxt.alpha = accuracyTxt.alpha = 0.75;
    scoreTxt.alpha = 0;
    missesTxt.x -= 120;
    accuracyTxt.x += 270;

    comboGroup.x = 760;
    comboGroup.y = 290;
}

function starvedLights()
    {
        //i fucking love that BLAMMED LIGHTS !! !!
        FlxTween.tween(burgerKingCities, {alpha: 0}, 1);
        FlxTween.tween(mcdonaldTowers, {alpha: 0}, 1);
        FlxTween.tween(pizzaHutStage, {alpha: 0}, 1);
        FlxTween.color(deadHedgehog, 1, FlxColor.WHITE, FlxColor.RED);
        FlxTween.color(boyfriend, 1, FlxColor.WHITE, FlxColor.RED);
    }

function starvedLightsFinale()
    {
        //i fucking HATE those BLAMMED LIGHTS !! !!
        FlxTween.tween(burgerKingCities, {alpha: 1}, 1.5);
        FlxTween.tween(mcdonaldTowers, {alpha: 1}, 1.5);
        FlxTween.tween(pizzaHutStage, {alpha: 1}, 1.5);
        FlxTween.color(deadHedgehog, 1, FlxColor.RED, FlxColor.WHITE);
        FlxTween.color(boyfriend, 1, FlxColor.RED, FlxColor.WHITE); //????? will it work lol? (update it totally worked :DDDD)
    }

function postUpdate(elapsed:Float) {
    fearBar.percent = fearNo;
	missesTxt.text = 'Sacarfices: ' + misses;
    FlxG.camera.zoom = FlxMath.lerp(1.35, FlxG.camera.zoom, boundTo(1 - (elapsed * 3.125), 0, 1));
    iconP1.x = healthBar.x + 215;
    iconP2.x = healthBar.x + 215;

    iconP1.y = healthBar.y
    + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01))
    + (150 * iconP1.scale.x - 150) / 2
    - iconOffset;
        iconP2.y = healthBar.y
    + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01))
    - (150 * iconP2.scale.x) / 2
    - iconOffset;

    // this is such a shitcan method i really should come up with something better tbf
    if (fearNo >= 50 && fearNo < 59)
        health -= 0.1 * elapsed;
    else if (fearNo >= 60 && fearNo < 69)
        health -= 0.13 * elapsed;
    else if (fearNo >= 70 && fearNo < 79)
        health -= 0.17 * elapsed;
    else if (fearNo >= 80 && fearNo < 89)
        health -= 0.20 * elapsed;
    else if (fearNo >= 90 && fearNo < 99)
        health -= 0.35 * elapsed;

    if (health <= 0.01)
    {
        health = 0.01;
    }
}
function boundTo(value:Float, min:Float, max:Float):Float {
		var newValue:Float = value;
		if(newValue < min) newValue = min;
		else if(newValue > max) newValue = max;
		return newValue;
	}
function update(elapsed:Float) {
    switch (curStep)
    {
        case 1184, 1471:
            starvedLights();
        case 1439, 1728:
            starvedLightsFinale();
    }
        // Fake 3D zoom effect
    var zoomFactor = FlxG.camera.zoom / 0.75;
    
    boyfriend.x = bfWX * zoomFactor;
    boyfriend.y = bfWY * zoomFactor;
    boyfriend.scale.set(zoomFactor, zoomFactor);

    if (fearNo >= 50 && fearNo < 59)
        health -= 0.1 * elapsed;
    else if (fearNo >= 60 && fearNo < 69)
        health -= 0.13 * elapsed;
    else if (fearNo >= 70 && fearNo < 79)
        health -= 0.17 * elapsed;
    else if (fearNo >= 80 && fearNo < 89)
        health -= 0.20 * elapsed;
    else if (fearNo >= 90 && fearNo < 99)
        health -= 0.35 * elapsed;

    if (health <= 0.01)
    {
        health = 0.01;
    }
}

function onPlayerHit(NoteHitEvent){
	fearNo -= 0.15;
 
}

function onDadHit(NoteHitEvent) {
	fearNo += 0.15;
}

function onPlayerMiss(note:Note) {
    fearNo += 0.15;
}

function onBeatHit() {

}
function onCameraMove(e) {
	switch (curCameraTarget){
		case 1: 
            e.position.set(bfX, bfY);
            defaultCamZoom = bfZoom;
		case 0: 
            e.position.set(dadX, dadY);
            defaultCamZoom = dadZoom;
        case 2: 
            e.position.set(bfX, bfY);
            defaultCamZoom = bfZoom;
    }
}
