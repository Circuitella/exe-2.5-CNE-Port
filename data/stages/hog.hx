import BGSprite;
import flixel.effects.FlxFlicker;

var hogBg:BGSprite;
var hogMotain:BGSprite;
var hogWaterFalls:FlxSprite;
var hogFloor:FlxSprite;
var hogLoops:FlxSprite;
var hogTrees:BGSprite;
var hogRocks:BGSprite;
var hogOverlay:BGSprite;
//manual blast
var scorchedBg:BGSprite;
var scorchedMotain:BGSprite;
var scorchedWaterFalls:FlxSprite;
var scorchedFloor:FlxSprite;
var scorchedMonitor:FlxSprite;
var scorchedHills:FlxSprite;
var scorchedTrees:BGSprite;
var scorchedRocks:BGSprite;

var useDadZoom:Bool = false;
function onCameraMove(e) {
	switch (curCameraTarget){
		case 1: 
            defaultCamZoom = boyfriendZoom;		
        case 0: 
            if(useDadZoom) defaultCamZoom = dadZoom;
            else defaultCamZoom = 0.68;
        default: 
            defaultCamZoom = 1;
    }
}
var monitorAnims:Array<String> = ['idle', 'fatal', 'nmi', 'needle', 'starved'];

function glitchKill(spr:FlxSprite,dontKill:Bool=false){
    FlxFlicker.flicker(spr, 1.5, 0.04, false, false, function(flick:FlxFlicker)
    {
        remove(spr, !dontKill);
        spr.alpha = 0;
        if(!dontKill){
        spr.destroy();
        }
    });
    //var shader = new GlitchShaderA();
    //shader.iResolution.value = [spr.width, spr.height];
    /*piss.push(FlxTween.tween(shader, {amount: 1.25}, 2, {
        ease: FlxEase.cubeInOut,
        onComplete: function(tw: FlxTween){
            //glitchShaders.remove(shader);
            spr.visible=false;
            if(!dontKill){
                remove(spr);
                spr.destroy();
            }
        }
    }));*/
    //glitchShaders.push(shader);
    //spr.shader = shader;
}
var dadZoom:Float = 0.68;
var boyfriendZoom:Float = 0.68;
function create() {
    useDadZoom = false;
    defaultCamZoom = 0.68;
    hogBg = new BGSprite('hog/bg', 0, -300, 1.1, 0.9);
    hogBg.scale.x = 2;
    hogBg.scale.y = 2;
    add(hogBg);

    hogMotain = new BGSprite('hog/motains', 0, 0, 1.1, 0.9);
    hogMotain.scale.x = 1.5;
    hogMotain.scale.y = 1.5;
    add(hogMotain);

    hogWaterFalls = new FlxSprite(-1100, 200);
    hogWaterFalls.frames = Paths.getSparrowAtlas('hog/Waterfalls');
    hogWaterFalls.animation.addByPrefix('water', 'British', 12);
    hogWaterFalls.animation.play('water');
    hogWaterFalls.scrollFactor.set(1, 1);
    add(hogWaterFalls);

    hogLoops = new FlxSprite(-200, 170);
    hogLoops.frames = Paths.getSparrowAtlas('hog/HillsandHills');
    hogLoops.animation.addByPrefix('loops', 'DumbassMF', 12);
    hogLoops.animation.play('loops');
    hogLoops.scrollFactor.set(1, 0.9);
    add(hogLoops);

    hogTrees = new BGSprite('hog/trees', -600, -120, 1, 0.9);
    add(hogTrees);

    hogFloor = new BGSprite('hog/floor', -600, 750, 1, 1);
    hogFloor.scale.x = 1.25;
    hogFloor.scale.y = 1.25;
    hogFloor.y += 1200;
    hogFloor.x -= 200;
    add(hogFloor);

    hogRocks = new BGSprite('hog/rocks', -500, 600, 1.1, 0.9);
    hogRocks.scale.x = 1.25;
    hogRocks.scale.y = 1.25;
    hogRocks.y += 900;
    hogRocks.x -= 600;

    hogOverlay = new BGSprite('hog/overlay', -800, -300, 1.1, 0.9);
    hogOverlay.scale.x = 1.25;
    hogOverlay.scale.y = 1.25;

    // camGlitchShader = new GlitchShaderB();
    // camGlitchShader.iResolution.value = [FlxG.width, FlxG.height];
    // camGlitchFilter = new ShaderFilter(camGlitchShader);

    // camFuckShader = new Fuck();
    // camFuckFilter = new ShaderFilter(camFuckShader);

    // staticlol = new StaticShader();
    // staticOverlay = new ShaderFilter(staticlol);
    // // camGame.setFilters([new ShaderFilter(staticlol)]);
    // staticlol.iTime.value = [0];
    // staticlol.iResolution.value = [FlxG.width, FlxG.height];
    // staticlol.alpha.value = [staticAlpha];
    // staticlol.enabled.value = [false];

    // glitchThingy = new DistortGlitchShader();
    // glitchOverlay = new ShaderFilter(glitchThingy);
    // glitchThingy.iTime.value = [0];
    // glitchThingy.iResolution.value = [FlxG.width, FlxG.height];
    // glitchThingy.enabled.value = [false];

    scorchedBg = new BGSprite('hog/blast/Sunset', 0, 0, 0, 0);
    scorchedBg.scale.x = 1.5;
    scorchedBg.scale.y = 1.5;
    scorchedBg.screenCenter();
    add(scorchedBg);

    scorchedMotain = new BGSprite('hog/blast/Mountains', -130, 0, 0.4, 0.9);
    scorchedMotain.scale.x = 1.5;
    scorchedMotain.scale.y = 1.5;
    scorchedMotain.x -= 700;
    add(scorchedMotain);

    scorchedWaterFalls = new FlxSprite(-1000, 200);
    scorchedWaterFalls.frames = Paths.getSparrowAtlas('hog/blast/Waterfalls');
    scorchedWaterFalls.animation.addByPrefix('water', 'British instance 1', 6);
    scorchedWaterFalls.animation.play('water');
    scorchedWaterFalls.scale.x = 1.1;
    scorchedWaterFalls.scale.y = 1.1;
    scorchedWaterFalls.scrollFactor.set(0.4, 1);
    add(scorchedWaterFalls);

    scorchedHills = new BGSprite('hog/blast/Hills', -100, 0, 0.55, 1);
    scorchedHills.y += 240;
    add(scorchedHills);

    scorchedMonitor = new FlxSprite(1260, 170);
    scorchedMonitor.frames = Paths.getSparrowAtlas('hog/blast/Monitor');
    scorchedMonitor.animation.addByPrefix('idle', 'Monitor', 12, false);
    scorchedMonitor.animation.addByPrefix('fatal', 'Fatalerror', 12, false);
    scorchedMonitor.animation.addByPrefix('nmi', 'NMI', 12, false);
    scorchedMonitor.animation.addByPrefix('needle', 'Needlemouse', 12, false);
    scorchedMonitor.animation.addByPrefix('starved', 'Storved', 12, false);
    scorchedMonitor.animation.play('idle');
    scorchedMonitor.scrollFactor.set(0.55, 1);
    add(scorchedMonitor);
    

    scorchedTrees = new BGSprite('hog/blast/Plants', -400, 200, 1, 0.9);
    add(scorchedTrees);
    scorchedTrees.y += 100;

    scorchedFloor = new BGSprite('hog/blast/Floor', -400, 880, 1, 1);
    scorchedFloor.scale.x = 2.25;
    scorchedFloor.scale.y = 2.25;
    scorchedFloor.y += 1300;
    scorchedFloor.x -= 150;
    add(scorchedFloor);

    scorchedRocks = new BGSprite('hog/blast/Rocks', -500, 600, 1.1, 0.9);
    scorchedRocks.scale.x = 1.25;
    scorchedRocks.scale.y = 1.25;

    scorchedBg.visible = false;
    scorchedMotain.visible = false;
    scorchedWaterFalls.visible = false;
    scorchedHills.visible = false;
    scorchedMonitor.visible = false;
    scorchedTrees.visible = false;
    scorchedFloor.visible = false;
    scorchedRocks.visible = false;

        // }else if(SONG.song.toLowerCase() == 'hedge'){
        //     camGlitchShader = new GlitchShaderB();
        //     camGlitchShader.iResolution.value = [FlxG.width, FlxG.height];
        //     camGlitchFilter = new ShaderFilter(camGlitchShader);

        //     staticlol = new StaticShader();
        //     staticOverlay = new ShaderFilter(staticlol);
        //     staticlol.iTime.value = [0];
        //     staticlol.iResolution.value = [FlxG.width, FlxG.height];
        //     staticlol.alpha.value = [staticAlpha];
        //     staticlol.enabled.value = [false];

        //     camFuckShader = new Fuck();
        //     camFuckFilter = new ShaderFilter(camFuckShader);

        //     camGame.setFilters([staticOverlay, camFuckFilter]);
        remove(boyfriend, true);
        insert(99, boyfriend);
        remove(dad, true);
        insert(99, dad);
        add(hogRocks);
        dad.x += 200;
        boyfriend.x += 200;
        boyfriend.y -= 150;
        dad.y -= 100;
}
	function colorTweenHog()
		{	//blammed lights but its not shit lol.
			FlxTween.color(hogBg, 15, FlxColor.WHITE, 0xFF1f1f1f);
			FlxTween.color(hogMotain, 15, FlxColor.WHITE, 0xFF1f1f1f);
			FlxTween.color(hogWaterFalls, 15, FlxColor.WHITE, 0xFF1f1f1f);
			FlxTween.color(hogLoops, 15, FlxColor.WHITE, 0xFF1f1f1f);
			FlxTween.color(hogTrees, 15, FlxColor.WHITE, 0xFF1f1f1f);
			FlxTween.color(hogFloor, 15, FlxColor.WHITE, 0xFF1f1f1f);
			FlxTween.color(hogRocks, 15, FlxColor.WHITE, 0xFF1f1f1f);  
			FlxTween.color(hogOverlay, 15, FlxColor.WHITE, 0xFF1f1f1f);
		}
function hyogStuff(){

        hogBg.visible = false;
        hogMotain.visible = false;
        hogWaterFalls.visible = false;
        hogLoops.visible = false;
        hogTrees.visible = false;
        hogFloor.visible = false;
        hogRocks.visible = false;

    
        scorchedBg.visible = true;
        scorchedMotain.visible = true;
        scorchedWaterFalls.visible = true;
        scorchedHills.visible = true;
        scorchedMonitor.visible = true;
        scorchedTrees.visible = true;
        scorchedFloor.visible = true;
        scorchedRocks.visible = true;
}
function playRandomMonitorAnim() {
    var anim:String = monitorAnims[FlxG.random.int(0, monitorAnims.length - 1)];
    scorchedMonitor.animation.play(anim, true);
}
function update(){
   if (!scorchedMonitor.animation.curAnim.finished && scorchedMonitor.visible) return;

    playRandomMonitorAnim(); 
}
function stepHit(curStep:Int) {
    switch (curStep)
        {
            case 512:
                colorTweenHog();
                FlxTween.tween(camHUD, {alpha: 0}, 2, {ease: FlxEase.cubeInOut, onComplete: function(twn:FlxTween)
                    {
                        camHUD.visible = false;
                        camHUD.alpha = 1;
                    }
                });
                blackFuck = new FlxSprite().makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
                blackFuck.alpha = 0;
                blackFuck.cameras = [camHUD];
                blackFuck.scrollFactor.set(0, 0);
                blackFuck.screenCenter();
                add(blackFuck);

                FlxTween.tween(blackFuck, {alpha: 1}, 1.5, {ease: FlxEase.cubeInOut});

            case 576, 582, 640, 646, 672, 678, 704, 710, 736, 742, 768, 774, 800, 806, 832, 838:
                FlxTween.tween(blackFuck, {alpha: 0}, 0.01, {ease: FlxEase.cubeInOut, onComplete: function(twn:FlxTween)
                    {
                        FlxTween.tween(blackFuck, {alpha: 1}, 0.4, {ease: FlxEase.cubeInOut});
                    }
                });
            case 559:
                camZooming = false;
            case 775:
            hyogStuff();    
            case 848:
                camZooming = true;
                hogOverlay.visible = false;
                FlxTween.tween(blackFuck, {alpha: 1}, 0.1, {ease: FlxEase.cubeInOut, onComplete: function(twn:FlxTween)
                    {
                        remove(blackFuck);
                        blackFuck.destroy();
                    }
                });
            case 864:
                FlxG.camera.flash(FlxColor.BLACK, 2.5);
                camHUD.visible = true;
                camHUD.alpha = 1;
                camHUD.zoom += 2;
                useDadZoom = true;
                dadZoom = 0.54;
                boyfriendZoom = 0.68;
                // if(ClientPrefs.flashing){
                //     camGame.setFilters([camGlitchFilter, staticOverlay]);
                //     camHUD.setFilters([camGlitchFilter]);
                // }

            case 4672:
                // if(ClientPrefs.flashing){
                //     camGame.setFilters([camGlitchFilter, camFuckFilter, staticOverlay]);
                //     camHUD.setFilters([camGlitchFilter, camFuckFilter]);
                // }
                
                /*FlxFlicker.flicker(scorchedMotain, 1.5, 0.04, false, false, function(flick:FlxFlicker)
                    {
                        remove(scorchedMotain);
                        scorchedMotain.destroy();
                    });*/
                    // camFuckShader.amount = 0.01;
                glitchKill(scorchedMotain);
            case 4704:
                /*FlxFlicker.flicker(scorchedWaterFalls, 1.5, 0.04, false, false, function(flick:FlxFlicker)
                    {
                        remove(scorchedWaterFalls);
                        scorchedWaterFalls.destroy();
                    });*/
                    // camFuckShader.amount = 0.035;
                glitchKill(scorchedWaterFalls);
            case 4736:
                // camFuckShader.amount = 0.075;
                glitchKill(scorchedHills);
                glitchKill(scorchedMonitor);
            case 4920:
                glitchKill(scorchedBg);
            case 4944:
                glitchKill(boyfriend, true);
                /*piss.push(FlxTween.tween(camFuckShader, {amount: 0.3}, 4, {
                    ease: FlxEase.cubeInOut
                }));*/
            case 4960:
                glitchKill(scorchedTrees);
            case 4978:
                glitchKill(scorchedRocks);
            case 4992:
                glitchKill(scorchedFloor);
            case 5000:
                glitchKill(dad, true);
                FlxTween.tween(camGame, {alpha: 0});
                FlxTween.tween(camHUD, {alpha: 0});
        }

}
