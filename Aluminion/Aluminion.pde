// To store the image:
PImage aluminion;

int xPosition;

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
    ellipse(xPosition, 263, 25, 25);
    
    // Setting up the eye bright:
    fill(255);
    stroke(0);
    ellipse(xPosition-5, 263-5, 8, 8);
    
    // Limits the position (x-axis) of the eye ball:
    if(mouseX<231){
        xPosition = 231;
    }
    else
    if(mouseX>257){
        xPosition = 257;
    }
    else{
        xPosition = mouseX;
    }
}
