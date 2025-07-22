import BGSprite;

var dadX:Float = 1000;
var dadY:Float = -100;
var bfX:Float = 1400;
var bfY:Float = -100;
var gfX:Float = -80;
var gfY:Float = 22;

var amongus:Bool = true;
var pickle:FlxSprite;
var fgTrees:BGSprite;
var genesis:FlxTypedGroup<FlxSprite>;

function onCameraMove(e) {
	switch (curCameraTarget){
		case 1: 
            e.position.set(bfX, bfY);
		case 0: 
            e.position.set(dadX, dadY);
        case 2: 
            e.position.set(bfX, bfY);
    }
}

function create(){
remove(dad);
remove(gf);
remove(combo);
remove(boyfriend);
defaultCamZoom = .75;
genesis = new FlxTypedGroup();
var sky:BGSprite = new BGSprite('run/sky', -600, -200, 1.0, 1.0);
genesis.add(sky);

var grassback:BGSprite = new BGSprite('run/GrassBack', -600, -200, 1.0, 1.0);
genesis.add(grassback);

var trees:BGSprite = new BGSprite('run/trees', -600, -200, 1.0, 1.0);
genesis.add(trees);

var grass:BGSprite = new BGSprite('run/Grass', -600, -200, 1.0, 1.0);
genesis.add(grass);

var treesfront:BGSprite = new BGSprite('run/TreesFront', -600, -200, 1.0, 1.0);
genesis.add(treesfront);

var topoverlay:BGSprite = new BGSprite('run/TopOverlay', -600, -200, 1.0, 1.0);
genesis.add(topoverlay);

pickle = new FlxSprite(-428.5 + 50 + 700, -449.35 + 25 + 392 + 105 + 50).loadGraphic(Paths.image("run/GreenHill"));
pickle.visible = false;
pickle.scrollFactor.set(1, 1);
pickle.active = false;
pickle.scale.x = 8;
pickle.scale.y = 8;
add(genesis);
add(pickle);
add(gf);
add(dad);
add(boyfriend);
boyfriend.x += 900;
boyfriend.y -= 400;
gf.x += 900;
gf.y -= 350;
gf.scrollFactor.set(1,1);
dad.x += 900;
dad.y -= 400;
}


function doStaticSign(lestatic:Int = 0, leopa:Bool = true)
	{
		var daStatic:FlxSprite = new FlxSprite(0, 0);

		daStatic.frames = Paths.getSparrowAtlas('daSTAT');

		daStatic.setGraphicSize(FlxG.width, FlxG.height);

		daStatic.screenCenter();

		daStatic.cameras = [camHUD];

		switch (lestatic)
		{
			case 0:
				daStatic.animation.addByPrefix('static', 'staticFLASH', 24, false);
		}
		add(daStatic);

		FlxG.sound.play(Paths.sound('staticBUZZ'));

		if (leopa)
		{
			if (daStatic.alpha != 0)
				daStatic.alpha = FlxG.random.float(0.1, 0.5);
		}
		else
			daStatic.alpha = 1;

		daStatic.animation.play('static');

		daStatic.animation.finishCallback = function(pog:String)
		{
			remove(daStatic);
		}
	}
var sex:FlxTimer;
var sex2:FlxTimer;
function stepHit(curStep)
{
var vg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/SonicP2/RedVG'));
vg.alpha = 0;
vg.cameras = [camHUD];
add(vg);

var amongus:Bool = true;

switch (curStep) // haha laugh funny
{
case 128, 328, 1288:
    dad.playAnim('laugh', true);

case 130, 132, 134, 136, 138, 140, 330, 332, 334, 1290, 1292, 1294:
    dad.playAnim('laugh', true);
case 142, 336, 1296:
}

if (curStep == 528) // PIXEL MOMENT LAWLALWALAWL
{
doStaticSign(0, false);
bgspec.visible = true;

}
else if (curStep == 784) // BACK TO NORMAL MF!!!
{

doStaticSign(0, false);
bgspec.visible = false;


}
else if (curStep == 521 && curStep == 1160)
{
camGame.shake(0.03, 1.5);
camHUD.shake(0.05, 1);
}
else if (curStep == 80 || curStep == 785) // MaliciousBunny did this
{
new FlxTimer().start(.085, function(sex:FlxTimer){
    if (curStep >= 528 && curStep <= 784)
        vg.visible = false;
    else
        vg.visible = true;

    if (!paused)
        vg.alpha += 0.1;
    if (vg.alpha < 1)
    {
        sex.reset();
    }
    if (vg.alpha == 1)
    {
        new FlxTimer().start(.085, function(sex2:FlxTimer)
        {
            if (!paused)
                vg.alpha -= 0.1;
            if (vg.alpha > 0)
            {
                sex2.reset();
            }
            if (vg.alpha == 0)
                sex.reset();
        });
    }
   });
  }
}