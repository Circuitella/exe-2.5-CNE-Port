import BGSprite;

//sunky stuff (no swearing.....)
var aspectRatio:Bool = true;
public var sunkerTimebarFuckery:Bool = false;
public var sunkerTimebarNumber:Int;
var cereal:FlxSprite;
var munch:FlxSprite;
var pose:FlxSprite;
var sunker:FlxSprite;
var spoOoOoOky:FlxSprite;

function postCreate() {

    /*	"boyfriend": [1325, -85],
	"girlfriend": [700, -100],
	"opponent": [410, -100]*/


    comboGroup.x = 300;
    comboGroup.y = 400;
    var bg:BGSprite = new BGSprite('sunky/sunky BG', -300, -500, 0.9, 0.9);
    add(bg);

    var balls:BGSprite = new BGSprite('sunky/ball', 20, -500, 0.9, 0.9);
    balls.screenCenter(FlxAxes.X);
    add(balls);

    var stage:BGSprite = new BGSprite('sunky/stage', 125, -500, 1.0, 1.0);
    stage.setGraphicSize(Std.int(stage.width * 1.1));
    add(stage);


    cereal = new FlxSprite(-1000, 0).loadGraphic(Paths.image("sunky/cereal"));
    cereal.cameras = [camHUD];
    cereal.screenCenter(FlxAxes.Y);
    add(cereal);

    munch = new FlxSprite(-1000, 0).loadGraphic(Paths.image("sunky/sunkyMunch"));
    munch.cameras = [camHUD];
    munch.screenCenter(FlxAxes.Y);
    add(munch);

    pose = new FlxSprite(-1000, 0).loadGraphic(Paths.image("sunky/sunkyPose"));
    pose.cameras = [camHUD];
    pose.screenCenter(FlxAxes.Y);
    add(pose);

    sunker = new FlxSprite(200, 0).loadGraphic(Paths.image("sunky/sunker"));
    sunker.cameras = [camHUD];
    sunker.frames = Paths.getSparrowAtlas('sunky/sunker');
    sunker.animation.addByPrefix('ya', 'sunker');
    sunker.animation.play('ya');
    sunker.setGraphicSize(Std.int(sunker.width * 5));
    sunker.updateHitbox();
    sunker.visible = false;
    add(sunker);

    if (aspectRatio)
    {
        var funnyAspect:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image("sunky/4_3 shit"));
        funnyAspect.screenCenter();
        funnyAspect.cameras = [camHUD];
        add(funnyAspect);
    }

    spoOoOoOky = new FlxSprite(0, 0).loadGraphic(Paths.image("sunky/sunkage"));
    spoOoOoOky.screenCenter();
    spoOoOoOky.visible = false;
    spoOoOoOky.cameras = [camHUD];
    add(spoOoOoOky);

    remove(boyfriend, true);
    insert(99, boyfriend);
    remove(gf, true);
    insert(98, gf);
    remove(dad, true);
    insert(99, dad);


}
function update(elapsed:Float) {
    			switch (curStep)
			    {
				case 64:
					FlxG.camera.zoom += 0.06;
				case 80:
					FlxG.camera.zoom += 0.06;
				case 96:
					supersuperZoomShit = true;
					FlxTween.tween(FlxG.camera, {zoom: 1.5}, 6.5);
				case 119:
					supersuperZoomShit = false;
					FlxTween.cancelTweensOf(FlxG.camera);
					FlxTween.tween(FlxG.camera, {zoom: 0.77}, 0.5);
				case 132:
					FlxTween.tween(FlxG.camera, {zoom: 1.9}, 2.5);
					camGame.shake(0.2, 0.85);
					camHUD.shake(0.2, 0.85);

					sunker.visible = true;
					sunker.alpha = 0;
					FlxTween.tween(sunker, {alpha: 1}, 1.5);
				case 144:
					FlxTween.cancelTweensOf(FlxG.camera);

					FlxTween.cancelTweensOf(sunker);
					sunker.alpha = 0;
					sunker.visible = false;

					FlxTween.tween(FlxG.camera, {zoom: 0.77}, 0.5);
					superZoomShit = true;
				case 352:
					FlxTween.tween(FlxG.camera, {zoom: 1.9}, 1.9);
					superZoomShit = false;
				case 367:
					FlxTween.cancelTweensOf(FlxG.camera);
					FlxTween.tween(FlxG.camera, {zoom: 0.77}, 0.5);
				case 404:
					superZoomShit = true;
				case 528:
					switch(FlxG.random.int(1, 3)){
						case 1:
							FlxTween.tween(cereal, {x: 1350}, 12.5);
						case 2:
							FlxTween.tween(munch, {x: 1350}, 12.5);
						case 3:
							FlxTween.tween(pose, {x: 1350}, 12.5);
					}
				case 639:
					superZoomShit = false;
					FlxTween.tween(FlxG.camera, {zoom: 1.3}, 0.5);
					defaultCamZoom = 1.3;
				case 651:
					FlxTween.tween(FlxG.camera, {zoom: 1.9}, 0.5);
					defaultCamZoom = 1.9;
				case 656:
					FlxTween.tween(FlxG.camera, {zoom: 0.77}, 0.5);
					defaultCamZoom = 0.9;
					superZoomShit = true;
				case 752:
					cereal.y = -1000;
					cereal.x = 500;
					munch.y = -1000;
					munch.x = 500;
					pose.y = -1000;
					pose.x = 500;
				case 784:
					switch(FlxG.random.int(1, 3)){
						case 1:
							FlxTween.tween(cereal, {y: 1150}, 9.8);
						case 2:
							FlxTween.tween(munch, {y: 1150}, 9.8);
						case 3:
							FlxTween.tween(pose, {y: 1150}, 9.8);
					}
				case 879:
					FlxTween.cancelTweensOf(cereal);
					FlxTween.cancelTweensOf(munch);
					FlxTween.cancelTweensOf(pose);
					cereal.y = -1000;
					cereal.x = 500;
				case 911:
					cereal.y = -1000;
					cereal.x = -700;
					munch.y = -1000;
					munch.x = -700;
					pose.y = -1000;
					pose.x = -700;
					switch(FlxG.random.int(1, 3)){
						case 1:
							FlxTween.tween(cereal, {y: 1050}, 10.8);
							FlxTween.tween(cereal, {x: 1350}, 10.8);
						case 2:
							FlxTween.tween(munch, {y: 1050}, 9.8);
							FlxTween.tween(munch, {x: 1350}, 10.8);
						case 3:
							FlxTween.tween(pose, {y: 1050}, 9.8);
							FlxTween.tween(pose, {x: 1350}, 10.8);
					}
				case 1423:
					camGame.alpha = 0;
				case 1439:
					spoOoOoOky.x -= 100;
					spoOoOoOky.visible = true;
					spoOoOoOky.alpha = 0;
					FlxTween.tween(spoOoOoOky, {alpha: 1}, 1.5);
				case 1455:
					FlxTween.cancelTweensOf(spoOoOoOky);
					spoOoOoOky.alpha = 0;
					camGame.alpha = 1;
			}
}