// To store the image:
PImage kitten;

// Setting up the environment:
void setup() {
    
    size(600, 338);
    kitten = loadImage("kitten.jpg");
}

void draw() {

    // Allows to access each image pixel individually:
    kitten.loadPixels();

    loadPixels();

    for (int x=0; x<width; x++) {

        for (int y=0; y<height; y++) {

            int location = x+y*width;

            float r = red(kitten.pixels[location]);
            float g = green(kitten.pixels[location]);
            float b = blue(kitten.pixels[location]);

            // If the pixels are located before the cursor (x-axis), invert color:
            if (x<mouseX) {

                pixels[location] = color(255-r, 255-g, 255-b);
            } 
            // Otherwise, the original color continues the same:
            else {
                
                pixels[location] = color(r, g, b);
            }
        }
    }

    updatePixels();
}
