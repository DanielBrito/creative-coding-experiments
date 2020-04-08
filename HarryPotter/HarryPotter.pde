PImage field, harry, pome;

int x;

void setup() {
    
    size(640, 361);
    background(0);

    field = loadImage("quidditch-field.png");
    harry = loadImage("harry_potter.png");
    pome = loadImage("golden_pome.png");

    x = width/2;
    
    imageMode(CENTER);
}

void draw() {

    background(255); 
    
    image(field, x, height/2);
    image(field, x + width, height/2 );
    
    image(harry, mouseX-50, mouseY);
    image(pome, mouseX+150-(random(10, 20)), mouseY-(random(20, 30)));
    
    x-=10;
    
    if ( x < -width/2 ) {
        
        x += width;
    }
}
