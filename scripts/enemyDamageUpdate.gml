if ( creationID != 0 )
{
    if ( instance_exists(creationID) )
    {
        with (creationID)
        {
            if ( creatorID == 0 )
            {
                creatorID = other.id;
            }
            if ( instance_exists(creatorID) )
            {
                image_index = creatorID.image_index;
                image_speed = creatorID.image_speed;
                x = creatorID.x;
                y = creatorID.y;
            }
        }
    }
}
