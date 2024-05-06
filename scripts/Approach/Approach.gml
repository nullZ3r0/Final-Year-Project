function Approach(speed, max_speed, acceleration)
{
    if (speed < max_speed) {
        speed += acceleration;
        if (speed > max_speed) {
            return max_speed;
        }
    } else {
        speed -= acceleration;
    
        if (speed < max_speed) {
            return max_speed;
        }
    }
    
    return speed;
}