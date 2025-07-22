function create() {
    comboGroup.x = 560;
    comboGroup.y = 290;
}

function postUpdate(elapsed:Float) comboGroup.forEachAlive(function(spr) if (spr.camera != camHUD) spr.camera = camHUD);
