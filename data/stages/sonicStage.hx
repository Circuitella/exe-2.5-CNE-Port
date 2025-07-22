import BGSprite;
var dadX:Float = 800;
var dadY:Float = -100;
var bfX:Float = 1100;
var bfY:Float = -100;
var gfX:Float = -80;
var gfY:Float = 22;
var daJumpscare:FlxSprite = new FlxSprite(0, 0);
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
function create()
{

remove(dad);
remove(gf);
remove(combo);
remove(boyfriend);
var sky:BGSprite = new BGSprite('PolishedP1/BGSky', -600, -200, 1, 1);
sky.setGraphicSize(Std.int(sky.width * 1.4));
add(sky);

var midTrees1:BGSprite = new BGSprite('PolishedP1/TreesMidBack', -600, -200, 0.7, 0.7);
midTrees1.setGraphicSize(Std.int(midTrees1.width * 1.4));
add(midTrees1);

var treesmid:BGSprite = new BGSprite('PolishedP1/TreesMid', -600, -200,  0.7, 0.7);
midTrees1.setGraphicSize(Std.int(midTrees1.width * 1.4));
add(treesmid);

var treesoutermid:BGSprite = new BGSprite('PolishedP1/TreesOuterMid1', -600, -200, 0.7, 0.7);
treesoutermid.setGraphicSize(Std.int(treesoutermid.width * 1.4));
add(treesoutermid);

var treesoutermid2:BGSprite = new BGSprite('PolishedP1/TreesOuterMid2', -600, -200,  0.7, 0.7);
treesoutermid2.setGraphicSize(Std.int(treesoutermid2.width * 1.4));
add(treesoutermid2);

var lefttrees:BGSprite = new BGSprite('PolishedP1/TreesLeft', -600, -200,  0.7, 0.7);
lefttrees.setGraphicSize(Std.int(lefttrees.width * 1.4));
add(lefttrees);

var righttrees:BGSprite = new BGSprite('PolishedP1/TreesRight', -600, -200, 0.7, 0.7);
righttrees.setGraphicSize(Std.int(righttrees.width * 1.4));
add(righttrees);

var outerbush:BGSprite = new BGSprite('PolishedP1/OuterBush', -600, -150, 1, 1);
outerbush.setGraphicSize(Std.int(outerbush.width * 1.4));
add(outerbush);

var outerbush2:BGSprite = new BGSprite('PolishedP1/OuterBushUp', -600, -200, 1, 1);
outerbush2.setGraphicSize(Std.int(outerbush2.width * 1.4));
add(outerbush2);

var grass:BGSprite = new BGSprite('PolishedP1/Grass', -600, -150, 1, 1);
grass.setGraphicSize(Std.int(grass.width * 1.4));
add(grass);

var deadegg:BGSprite = new BGSprite('PolishedP1/DeadEgg', -600, -200, 1, 1);
deadegg.setGraphicSize(Std.int(deadegg.width * 1.4));
deadegg.isGore = true;
add(deadegg);

var deadknux:BGSprite = new BGSprite('PolishedP1/DeadKnux', -600, -200, 1, 1);
deadknux.setGraphicSize(Std.int(deadknux.width * 1.4));
deadknux.isGore = true;
add(deadknux);

var deadtailz:BGSprite = new BGSprite('PolishedP1/DeadTailz', -700, -200, 1, 1);
deadtailz.setGraphicSize(Std.int(deadtailz.width * 1.4));
deadtailz.isGore = true;
add(deadtailz);

var deadtailz1:BGSprite = new BGSprite('PolishedP1/DeadTailz1', -600, -200, 1, 1);
deadtailz1.setGraphicSize(Std.int(deadtailz1.width * 1.4));
deadtailz1.isGore = true;
add(deadtailz1);

var deadtailz2:BGSprite = new BGSprite('PolishedP1/DeadTailz2', -600, -400, 1, 1);
deadtailz2.setGraphicSize(Std.int(deadtailz2.width * 1.4));
deadtailz2.isGore = true;
add(deadtailz2);

fgTrees = new BGSprite('PolishedP1/TreesFG', -610, -200, 1.1, 1.1);
fgTrees.setGraphicSize(Std.int(fgTrees.width * 1.45));

add(gf);
add(dad);
add(boyfriend);
/*
	"boyfriend": [ 550, -45 ],
	"girlfriend": [ 100, -45 ],
	"opponent": [ -250, 0 ]*/
boyfriend.x += 600;
boyfriend.y -= 510;
gf.x += 600;
gf.y -= 480;
gf.scrollFactor.set(1,1);
dad.x += 600;
dad.y -= 600;
daJumpscare.frames = Paths.getSparrowAtlas('jumps/sonicJUMPSCARE');
daJumpscare.animation.addByPrefix('jump', 'sonicSPOOK', 24, false);
daJumpscare.alpha = 0.0000000000001;
daJumpscare.screenCenter();
daJumpscare.scale.x = 1.1;
daJumpscare.scale.y = 1.1;
daJumpscare.cameras = [camHUD];
daJumpscare.y += 370;
add(daJumpscare);
}
function doSimpleJump()
	{
		trace('SIMPLE JUMPSCARE');

		var simplejump:FlxSprite = new FlxSprite().loadGraphic(Paths.image('jumps/simplejump'));

		simplejump.setGraphicSize(FlxG.width, FlxG.height);

		simplejump.screenCenter();

		simplejump.cameras = [camHUD];

		FlxG.camera.shake(0.0025, 0.50);

		add(simplejump);

		FlxG.sound.play(Paths.sound('sppok'));

		new FlxTimer().start(0.2, function(tmr:FlxTimer)
		{
			trace('ended simple jump');
			remove(simplejump);
		});

		// now for static

		var daStatic:FlxSprite = new FlxSprite(0, 0);

		daStatic.frames = Paths.getSparrowAtlas('daSTAT');

		daStatic.setGraphicSize(FlxG.width, FlxG.height);

		daStatic.screenCenter();

		daStatic.cameras = [camHUD];

		daStatic.animation.addByPrefix('static', 'staticFLASH', 24, false);

		add(daStatic);

		FlxG.sound.play(Paths.sound('staticBUZZ'));

		if (daStatic.alpha != 0)
			daStatic.alpha = FlxG.random.float(0.1, 0.5);

		daStatic.animation.play('static');

		daStatic.animation.finishCallback = function(pog:String)
		{
			trace('ended static');
			remove(daStatic);
		}
	}
function doStaticSign(lestatic:Int = 0, leopa:Bool = true)
	{
		trace('static MOMENT HAHAHAH ' + lestatic);
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
			trace('ended static');
			remove(daStatic);
		}
	}

function doJumpscare()
{
trace('JUMPSCARE aaaa');

FlxG.sound.play(Paths.sound('jumpscare'), 1);
FlxG.sound.play(Paths.sound('datOneSound'), 1);

daJumpscare.alpha = 1;
daJumpscare.animation.play('jump');
daJumpscare.animation.finishCallback = function(pog:String)
{

	trace('ended jump');
	daJumpscare.alpha = 0.000000000000001;
}
}
function createPost()
{}
function Postcreate()
{}
function stepHit(curStep)
	{
    switch (curStep)
			{
				case 27:
					doStaticSign(0);
				case 130:
					doStaticSign(0);
				case 265:
					doStaticSign(0);
				case 450:
					doStaticSign(0);
				case 645:
					doStaticSign(0);
				case 800:
					doStaticSign(0);
				case 855:
					doStaticSign(0);
				case 889:
					doStaticSign(0);
				case 921:
					doSimpleJump();
				case 938:
					doStaticSign(0);
				case 981:
					doStaticSign(0);
				case 1030:
					doStaticSign(0);
				case 1065:
					doStaticSign(0);
				case 1105:
					doStaticSign(0);
				case 1123:
					doStaticSign(0);
				case 1178:
					doSimpleJump();
				case 1245:
					doStaticSign(0);
				case 1305:	
					var objs = [
						// me lo robe de lunar
						healthBar,
						healthBarBG,
						iconP1,
						iconP2,
						scoreTxt,
						missesTxt,
						accuracyTxt
						
										 
					];
					cpuStrums.forEach(function(spr)
					{
						objs.push(spr);
					});
					playerStrums.forEach(function(spr)
					{
						objs.push(spr);
					});
					for (obj in objs)
					{
						FlxTween.tween(obj, {alpha: 0}, 1, {
							onComplete: function(twn)
							{
								obj.visible = false;
							}
						});
					}
					for (i in cpuStrums.members) 
						FlxTween.tween(i, {x: i.x - 9650}, .01, {ease: FlxEase.smootherStepInOut});
				case 1337:
					doSimpleJump();
				case 1345:
					doStaticSign(0);
				case 1432:
					doStaticSign(0);
					var objs = [
						// me lo robe de lunar
						healthBar,
						healthBarBG,
						iconP1,
						iconP2,
						scoreTxt,
						missesTxt,
						accuracyTxt
						
										 
					];
					cpuStrums.forEach(function(spr)
					{
						objs.push(spr);
					});
					playerStrums.forEach(function(spr)
					{
						objs.push(spr);
					});
					for (obj in objs)
					{
						FlxTween.tween(obj, {alpha: 1}, .1, {
							onComplete: function(twn)
							{
								for (i in cpuStrums.members) 
									FlxTween.tween(i, {x: i.x + 9650}, .01, {ease: FlxEase.smootherStepInOut});
								obj.visible = true;
							}
						});
					}
				case 1454:
					doStaticSign(0);
				case 1495:
					doStaticSign(0);
				case 1521:
					doStaticSign(0);
				case 1558:
					doStaticSign(0);
				case 1578:
					doStaticSign(0);
				case 1599:
					doStaticSign(0);
				case 1618:
					doStaticSign(0);
				case 1647:
					doStaticSign(0);
				case 1657:
					doStaticSign(0);
				case 1692:
					doStaticSign(0);
				case 1713:
					doStaticSign(0);
				case 1723:
					doJumpscare();
				case 1738:
					doStaticSign(0);
				case 1747:
					doStaticSign(0);
				case 1761:
					doStaticSign(0);
				case 1785:
					doStaticSign(0);
				case 1806:
					doStaticSign(0);
				case 1816:
					doStaticSign(0);
				case 1832:
					doStaticSign(0);
				case 1849:
					doStaticSign(0);
				case 1868:
					doStaticSign(0);
				case 1887:
					doStaticSign(0);
				case 1909:
					doStaticSign(0);
			}
    }