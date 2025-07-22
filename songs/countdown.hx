var blackFuck:FlxSprite;
var startCircle:FlxSprite;
var startText:FlxSprite;

function onCountdown(event)
event.cancel();
function create() {
    PlayState.introLength = 1.7;
}
var blacklistedSongs = ['soulless', 'milk','fatality'];
function postCreate(){
blackFuck = new FlxSprite().makeGraphic(FlxG.width * 3  , FlxG.height * 2, FlxColor.BLACK);
blackFuck.x = -800;
add(blackFuck);
blackFuck.cameras = [camHUD];
startCircle = new FlxSprite();
startText = new FlxSprite();
startCircle.loadGraphic(Paths.image('StartScreens/Circle-' + PlayState.SONG.meta.name));
startCircle.x += 777;
startText.loadGraphic(Paths.image('StartScreens/Text-'+ PlayState.SONG.meta.name));
startText.x -= 1200;

add(blackFuck);
add(startCircle);
add(startText);
startText.cameras = [camHUD];
startCircle.cameras = [camHUD];
for(i in blacklistedSongs){
        if(PlayState.SONG.meta.displayName == i){
            specialTime();
            return;
        }
        else{
            normalTween();
        }
    }
}
function normalTween(){
    for(i in blacklistedSongs){
        if(PlayState.SONG.meta.displayName == i) return;
    }
    new FlxTimer().start(0.6, function(tmr:FlxTimer)
    {
        FlxTween.tween(startCircle, {x: 0}, 0.5);
        FlxTween.tween(startText, {x: 0}, 0.5);
    });

    new FlxTimer().start(1.9, function(tmr:FlxTimer)
    {
        FlxTween.tween(startCircle, {alpha: 0}, 1);
        FlxTween.tween(startText, {alpha: 0}, 1);
        FlxTween.tween(blackFuck, {alpha: 0}, 1);
    });
}
function specialTime(){
        if(PlayState.SONG.meta.displayName == 'milk'){
        add(blackFuck);
        startCircle.loadGraphic(Paths.image('StartScreens/Sunky'));
        startCircle.scale.x = 0.1;
        startCircle.x += 50;
        add(startCircle);
        
        new FlxTimer().start(0.6, function(tmr:FlxTimer)
        {
            FlxTween.tween(startCircle, {x: 0}, 0.2, {ease: FlxEase.elasticOut});
            FlxTween.tween(startCircle.scale, {x: 1}, 0.2, {ease: FlxEase.elasticOut});
            FlxG.sound.play(Paths.sound('flatBONK'));
        });

        new FlxTimer().start(1.9, function(tmr:FlxTimer)
        {
            FlxTween.tween(blackFuck, {alpha: 0}, 1, {
                onComplete: function(twn:FlxTween)
                {
                    remove(blackFuck);
                    blackFuck.destroy();
                }
            });
            FlxTween.tween(startCircle, {alpha: 0}, 1, {
                onComplete: function(twn:FlxTween)
                {
                    remove(startCircle);
                    startCircle.destroy();
                }
            });
        });
    }
}