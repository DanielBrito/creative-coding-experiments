class Bubble{
    
    float x, y;
    float diameter, ySpeed;
    
    Bubble(float d){
        
        x = random(170, 190);
        y = height-100;
        diameter = d;
        ySpeed = random(0.5, 2.5);
    }
    
    // To control the speed at which the bubbles rise: 
    void ascend(){
        
        y -= ySpeed;
    }
    
    // To control how the bubbles are displayed on the screen:
    void display(){
        
        fill(200, 0, 0, 100);
        noStroke();
        
        // When they should disapear:
        if(y<78){
            
            noFill();
        }
        
        ellipse(x, y, diameter, diameter);
    }
    
    // To restart the position when the bubble reaches the maximum height allowed:
    void top(){
        
        if(y < -diameter/2){
            
            y = 400+diameter/2;
        }
    }
}
