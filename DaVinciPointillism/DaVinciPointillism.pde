// To store the image:
PImage monalisa;

// Setting up the canvas:
void setup() {
    
    size(403, 600);
    
    monalisa = loadImage("monalisa.jpg");
    
    background(255);
}

void draw() {

    // On each iteration 50 ellipses are drawn: 
    for (int i=0; i<50; i++) {
        
        // Generating some random position to set the ellipse:
        float x = random(width);
        float y = random(height);
        
        // Gets the color at the point (x, y) of the image:
        color c = monalisa.get(int(x), int(y));

        // Setting the properties of the ellipse:
        fill(c);
        noStroke();
        
        ellipse(x, y, 10, 10);
    }
}
