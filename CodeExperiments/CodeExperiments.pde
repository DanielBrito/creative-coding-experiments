int yPos = 130;
boolean mixture = false;
boolean drop = false;
int alpha = 255;
float speed = 0.5;

PImage img;

Bubble[] bubbles = new Bubble[20];

void setup() {

    size(640, 460);
    img = loadImage("background.jpg");
    
    for (int i=0; i<bubbles.length; i++) {
        bubbles[i] = new Bubble(random(10, 20));
    }
}

void draw() {

    background(255);
    loadBackground();
    
    for (int i=0; i<bubbles.length; i++) {
        bubbles[i].ascend();
        bubbles[i].display();
        bubbles[i].top();
    }

    title();
    name();
    table();

    experimentA();
    tuboDeEnsaio();

    experimentB();
    letter();
    bequer();
}

void title() {

    // Text:
    textAlign(CENTER);
    textSize(45);
    fill(0);
    text("Creative Coding", 220, 70);

    textAlign(CENTER);
    textSize(50);
    fill(0);
    text("Experim  nts", 410, 130);


    // Curly bracklets:
    textSize(60);
    fill(200, 0, 200);
    text("{", 30, 70);

    textSize(65);
    fill(200, 0, 200);
    text("}", 578, 135);
}

void letter() {
    textSize(50);
    fill(0, 0, 255, alpha);
    text("e", 472, yPos);

    if (yPos<400 && drop) {
        yPos += 1*speed;
        speed += 0.1;
    }

    if (yPos>340) {
        mixture = true;
        alpha -= 20;
    }
}

void name() {

    textAlign(CENTER);
    textSize(20);
    fill(0, 100, 0);
    text("/* by Daniel Brito */", width/2, 180);
}

void table() {

    stroke(0);
    strokeWeight(2);
    fill(200, 80, 0);
    rect(0, 400, width, height-400);
}

void bequer() {

    stroke(0);
    strokeWeight(2);
    noFill();

    rect(400, 280, 130, 120);
}

void tuboDeEnsaio() {

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

void experimentB() {

    if (mixture) {

        for (int y=320; y<=400; y++) {

            if (y<=yPos) {

                stroke(0, 255, 0);
                line(400, y, 530, y);
            } else {
                stroke(255, 255, 0);
                line(400, y, 530, y);
            }
        }
    } else {

        for (int y=320; y<=400; y++) {

            stroke(255, 255, 0);
            line(400, y, 530, y);
        }
    }
}

void mousePressed() {

    drop = true;
}

void keyPressed() {

    reset();
}

void reset() {

    alpha = 255;
    yPos = 130;
    drop = false;
    speed = 0.5;
}

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
