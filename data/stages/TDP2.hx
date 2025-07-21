import flixel.FlxCameraFollowStyle;


function create(){
    PlayState.instance.introLength = 0;
}
function createPost(){
    camGame.alpha = 0;
    camHUD.alpha = 0;
}
function onSongStart(){
    camGame.alpha = 0;
    camHUD.alpha = 0;
    dad.screenCenter(FlxAxes.X);
}
function postUpdate(elapsed:Float) {
	FlxG.camera.follow(camFollow, FlxCameraFollowStyle.LOCKON, 1);
}
function stepHit(){
        switch (curStep)
        {
        case 1:
            FlxTween.tween(camGame, {alpha: 1}, 12);
        case 64:
            FlxTween.tween(camHUD, {alpha: 1}, 12);
        case 127:
            defaultCamZoom = 0.8;
    }
}