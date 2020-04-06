// To store the position (y-axis) of the letter 'e':
int yPositionE;

// To indicate when the color of the liquid has to be changed:
boolean mixture;
 
// To indicate when the letter 'e' falls (after a mouse click):
boolean falling;

// To control the transparency of the letter 'e':
int alpha;

// To control the speed of the letter 'e' during the fall:
float speed;

// To store the background image:
PImage img;

// To store the bubbles:
Bubble[] bubbles;

void setup() {

    size(640, 460);

    // Configuring the scene:
    
    yPositionE = 130;
    mixture = false;
    falling = false;
    alpha = 255;
    speed = 0.5;
    
    img = loadImage("background.jpg");
    
    // Generating the bubbles:
    
    bubbles = new Bubble[20];

    for (int i=0; i<bubbles.length; i++) {
        
        // Generating bubbles with random (10 to 20 pixels) of diameter:
        bubbles[i] = new Bubble(random(10, 20));
    }
}

void draw() {

    background(255);
    
    loadBackground();

    // Setting up the bubbles on the screen:
    for (int i=0; i<bubbles.length; i++) {
        
        bubbles[i].ascend();
        bubbles[i].display();
        bubbles[i].top();
    }

    // Displaying elements:
    
    title();
    name();
    table();

    experimentA();
    testTube();

    experimentB();
    letter();
    bequer();
}

// To set the elements of the title:
void title() {
    
    textAlign(CENTER);
    textSize(45);
    fill(0);
    text("Creative Coding", 220, 70);

    textAlign(CENTER);
    textSize(50);
    fill(0);
    text("Experim  nts", 410, 130);

    textSize(60);
    fill(200, 0, 200);
    text("{", 30, 70);

    textSize(65);
    fill(200, 0, 200);
    text("}", 578, 135);
}

// To set the characteristics of the letter 'e':
void letter() {
    
    textSize(50);
    fill(0, 0, 255, alpha);
    text("e", 472, yPositionE);

    // Controls when and how the letter should fall:
    if (yPositionE<400 && falling) {
        
        yPositionE += 1*speed;
        speed += 0.1;
    }

    // Check if its position is equal to the liquid (which starts at the position 340):
    if (yPositionE>340) {
     
        // To start changing the color of the liquid:
        mixture = true;
        
        // Increase the transparency to give an impression of dissolution:
        alpha -= 20;
    }
}

// To set the name on the screen:
void name() {

    textAlign(CENTER);
    textSize(20);
    fill(0, 100, 0);
    text("/* by Daniel Brito */", width/2, 180);
}


// To set the table on the screen:
void table() {

    stroke(0);
    strokeWeight(2);
    fill(200, 80, 0);
    rect(0, 400, width, height-400);
}

// To set the bequer on the table:
void bequer() {

    stroke(0);
    strokeWeight(2);
    noFill();

    rect(400, 280, 130, 120);
}

// To set the test-tube on the table:
void testTube() {

    stroke(0);
    strokeWeight(2);
    noFill();

    beginShape();
    vertex(100, 400);
    vertex(160, 300);
    vertex(160, 240);
    vertex(200, 240);
    vertex(200, 300);
    vertex(260, 400);
    endShape(CLOSE);
}

// To set the red liquid inside the test-tube:
void experimentA() {

    stroke(255, 0, 0);
    strokeWeight(2);
    fill(255, 0, 0);

    beginShape();
    vertex(100, 400);
    vertex(130, 350);
    vertex(230, 350);
    vertex(260, 400);
    endShape(CLOSE);
}

// To set the yellow/green liquid inside the bequer:
void experimentB() {

    // If the letter touches the liquid:
    if (mixture) {

        // The liquid starts when the y-axis value is 320 and go until 400:
        for (int y=320; y<=400; y++) {
            
            // Starts changing the color of each line the letter 'e' passes by:
            if (y<=yPositionE) {

                stroke(0, 255, 0);
                line(400, y, 530, y);
            } 
            // Otherwise, the color continues the same:
            else {
                
                stroke(255, 255, 0);
                line(400, y, 530, y);
            }
        }
    } 
    // Otherwise, the color continues the same:
    else {

        for (int y=320; y<=400; y++) {

            stroke(255, 255, 0);
            line(400, y, 530, y);
        }
    }
}

// To interact with the user through the mouse:
void mousePressed() {

    // Makes the letter 'e' fall:
    falling = true;
}

// To interact with the user through the keyboard:
void keyPressed() {

    reset();
}

// To restore the default configuration:
void reset() {

    alpha = 255;
    yPositionE = 130;
    falling = false;
    speed = 0.5;
}

// To load each pixel of the background image:
void loadBackground() {

    image(img, 0, 0, width, height);

    img.loadPixels();

    loadPixels();

    for (int x=0; x<width; x++) {

        for (int y=0; y<height; y++) {

            int location = x+y*width;

            float r = red(img.pixels[location]);
            float g = green(img.pixels[location]);
            float b = blue(img.pixels[location]);

            pixels[location] = color(r, g, b);
        }
    }

    updatePixels();
}
