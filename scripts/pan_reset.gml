if (instance_exists(oPAN))
    instance_destroy(oPAN);
    
randomize();
var _pan = instance_create(room_width >> 1, 30, oPAN);
_pan.spawnCtr = 30;
_pan.vx = random_range(-2, 2);
_pan.vy = random_range(-4, -2);
_pan.vt = random_range(-8, 8); // torque
_pan.active = true;
//_pan.canPhysics = true;

// particle - BOOM
repeat (irandom_range(2, 3))
{
    var _inst = instance_create(_pan.x + random_range(-16, 16), _pan.y + random_range(-16, 16), oFX_BOOM);
}

// particle - line
var _n = 8, _ang = 360 / _n;
for (var i=0; i<_n; i++)
{
    var _inst = instance_create(_pan.x, _pan.y, oFX_LINE);
    _inst.vx = lengthdir_x(8, _ang * i);
    _inst.vy = lengthdir_y(8, _ang * i);
    _inst.image_xscale = 1.5;
    _inst.image_yscale = 1.5;
    _inst.life = 20;
}

// POMF
emit_sfx(sndPOMF, 1, 1);

return _pan;
