_projectile = instance_create_layer(x,y,"ProjectilesBack",obj_Projectile);
_projectile.char = argument0;
_projectile.projectile = argument1;
_projectile.knockbackX = argument2;
_projectile.knockbackY = argument3;
_projectile.damage = argument4;
_projectile.percentMultiplier = argument5;
_projectile.owner = argument6;
_projectile.framesGiven = argument7;
_projectile.hsp = argument8;
_projectile.vsp = argument9;
_projectile.dir = argument10;
_projectile.maxPauseFrames = argument11;
_projectile.isPaused = argument12;
//woot
return _projectile; 