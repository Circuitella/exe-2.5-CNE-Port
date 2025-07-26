import BGSprite;
var daJumpscare:FlxSprite = new FlxSprite(0, 0);
function create(){
	importScript("data/scripts/majin");

	defaultCamZoom = 0.9;

	var SKY:BGSprite = new BGSprite('FunInfiniteStage/sonicFUNsky', -600, -200, 1.0, 1.0);
	add(SKY);

	var bush:BGSprite = new BGSprite('FunInfiniteStage/Bush 1', -42, 171, 1.0, 1.0);
	add(bush);

	var pillars2:BGSprite = new BGSprite('FunInfiniteStage/Majin Boppers Back', 182, -100, 1.0, 1.0, ['MajinBop2 instance 1'], true);
	add(pillars2);

	var bush2:BGSprite = new BGSprite('FunInfiniteStage/Bush2', 132, 354, 1.0, 1.0);
	add(bush2);

	var pillars1:BGSprite = new BGSprite('FunInfiniteStage/Majin Boppers Front', -169, -167, 1.0, 1.0, ['MajinBop1 instance 1'], true);
	add(pillars1);

	var floor:BGSprite = new BGSprite('FunInfiniteStage/floor BG', -340, -0, 1.0, 1.0);
	add(floor);
	floor.y = 600;

	fgmajin = new BGSprite('FunInfiniteStage/majin FG1', 1126, 903, 1.0, 1.0, ['majin front bopper1'], true);

	fgmajin2 = new BGSprite('FunInfiniteStage/majin FG2', -393, 871, 1.0, 1.0, ['majin front bopper2'], true);

remove(dad);
remove(gf);

remove(boyfriend);

insert(0, gf);
insert(99, dad);
insert(99, boyfriend);
boyfriend.x = 1310;
boyfriend.y = 275;
dad.x = 410;
dad.y = 180;
gf.x = 400;
gf.y = 1230;
}
function createPost()
{


}

function Postcreate()
{

}

function stepHit(curStep)
{
} 