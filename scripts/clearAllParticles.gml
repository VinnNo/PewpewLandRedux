if (instance_exists(oBones))
{
    var particleSweep;
    with (oBones)
    {
        particleSweep = id;
    }
    if ( instance_exists(particleSweep) )
    {
        with (particleSweep)
        {
            instance_destroy();
        }
        
        if ( instance_exists(oBones) )
        {
            clearAllParticles();
        }
    }
}
