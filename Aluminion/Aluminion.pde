// To store the image:
PImage aluminion;

int xPosition, yPosition;

// Setting up the environment:
void setup() {
    
    size(500, 500);
    
    aluminion = loadImage("aluminion.png");
}

void draw() {

    // Allows to access each image pixel individually:
    aluminion.loadPixels();

    loadPixels();

    for (int x=0; x<width; x++) {

        for (int y=0; y<height; y++) {

            int location = x+y*width;

            float r = red(aluminion.pixels[location]);
            float g = green(aluminion.pixels[location]);
            float b = blue(aluminion.pixels[location]);

            pixels[location] = color(r, g, b);
        }
    }

    updatePixels();
    
    // Setting up the eye ball:
    fill(0);
    stroke(0);
    ellipse(xPosition, yPosition, 25, 25);
    
    // Setting up the eye bright:
    fill(255);
    stroke(0);
    ellipse(xPosition-5, yPosition-5, 8, 8);
    
    // Limits the position (x-axis) of the eye ball:
    if(mouseX<=231){
        xPosition = 231;
    }
    else
    if(mouseX>=257){
        xPosition = 257;
    }
    else{
        xPosition = mouseX;
    }
    
    // Limits the position (y-axis) of the eye ball:
    if(mouseY>=278){
        yPosition = 278;
    }
    else
    if(mouseY<=263){
        yPosition = 263;
    }
    else{
        yPosition = mouseY;
    }
}
