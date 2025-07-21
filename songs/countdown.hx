var blackFuck:FlxSprite;
var startCircle:FlxSprite;
var startText:FlxSprite;

function onCountdown(event)
event.cancel();
function create() {
    PlayState.introLength = 1.7;
}
function postCreate(){
if(PlayState.SONG.meta.displayName != 'soulless'){

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
else
    return;
}