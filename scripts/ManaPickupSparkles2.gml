if (random(100) > 90)
{
    var ID;
    ID = instance_create(x, y, oManaPickupParticle)
    ID.direction = random_range(2, -2);
}
