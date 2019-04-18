var _gamer = instance_create(argument0, argument1, oGAMER);

var _n = 8, _ang = 360 / _n;
for (var i=0; i<_n; i++)
{
    var _inst = instance_create(_gamer.x, _gamer.y, oFX_LINE);
    _inst.vx = lengthdir_x(8, _ang * i);
    _inst.vy = lengthdir_y(8, _ang * i);
    _inst.image_xscale = 1.5;
    _inst.image_yscale = 1.5;
    _inst.life = 20;
}

return _gamer;
