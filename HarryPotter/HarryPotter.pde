// To store the images:
PImage field, harry, pome;

int speedAnimation;

void setup() {
    
    // Setting up the scene:
    
    size(640, 361);
    background(0);

    field = loadImage("quidditch-field.png");
    harry = loadImage("harry_potter.png");
    pome = loadImage("golden_pome.png");

    speedAnimation = width/2;
    
    imageMode(CENTER);
}

void draw() {

    background(255); 
    
    // Setting up the field to give a motion impression by moving it through the x-axis in a kind of loop:
    image(field, speedAnimation, height/2);
    
    // To make the field looks continuous:
    image(field, speedAnimation+width, height/2);
    
    // Setting up the (dynamic) position of the elements:
    image(harry, mouseX-50, mouseY);
    image(pome, mouseX+150-(random(10, 20)), mouseY-(random(20, 30)));
    
    // Decreasing the position of the field on the x-axis:
    speedAnimation-=10;
    
    // Restarting the field loop:
    if (speedAnimation<-width/2) {

        speedAnimation += width;
    }
}
