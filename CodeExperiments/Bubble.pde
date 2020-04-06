class Bubble{
    float x, y;
    float diameter, ySpeed;
    
    Bubble(float tempD){
        x = random(170, 190);
        y = height-100;
        diameter = tempD;
        ySpeed = random(0.5, 2.5);
    }
    
    void ascend(){
        y -= ySpeed;
    }
    
    void display(){
        fill(200, 0, 0, 100);
        noStroke();
        
        if(y<78){
            noFill();
        }
        
        ellipse(x, y, diameter, diameter);
    }
    
    void top(){
        if(y < -diameter/2){
            y = 400+diameter/2;
        }
    }
}
