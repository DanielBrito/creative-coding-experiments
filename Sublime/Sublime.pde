// Stores the background image (Sublime Text):
PImage sublimeBackground;

// Stores the font used to print the text:
PFont f;

// Control which line or character will be printed:
int index = 0;
int i=0;

// Control the position of the lines and characters during the typing process:
int xPos = 90;
int yPos = 110;

// Stores each line of the poem:
String[] lines;

// Setting up the environment:
void setup() {

    // Configuring the window size:
    size(500, 400);

    // Configuring the font style:
    f = createFont("Consolas", 25, true);

    // Configuring the background:
    sublimeBackground = loadImage("sublime_background.jpg");
    image(sublimeBackground, 0, 0, width, height);

    // Reading the (concrete) poem from the file:
    lines = loadStrings("sublime.txt");
    
    // Brief delay before start typing:
    frameRate(0.5);
}

void draw() {

    // Configuring the text:
    fill(255);
    textSize(25);

    // Printing each line separetely, because each one has different styles:
    
    if (index==0) {
        
        // Printing the line of the code:
        fill(180);
        text("1", 30, 110);
        
        fill(255);
        
        // Printing each character of a given line:
        if (i<lines[index].length()) {
            
            // Changing color based on the syntax:
            if(i>=0 && i<=7){
                fill(249, 38, 114);
            }
            else{
                fill(237, 223, 116);
            }

            // Configuring the character to be printed:
            text(lines[index].charAt(i), xPos, yPos);

            // Setting up the position (x-axis) of the next character:
            xPos += textWidth(lines[index].charAt(i));

            // Delay between each printed character:
            frameRate(8);
        } 
        // The line was completely printed
        else {
            
            // Setting up next line:
            index++;
            
            // Restarting to the first line character:
            i=-1;
            
            // Setting up the position of the new line:
            xPos = 90;
            yPos += 35;
        }

        // Incrementing (next character of the line):
        i++;
    }
    
    // The next conditions follow the same idea:

    if (index==1) {
        
        fill(180);
        text("2", 30, 145);
        
        fill(255);

        if (i<lines[index].length()) {
            
            text(lines[index].charAt(i), xPos, yPos);

            xPos += textWidth(lines[index].charAt(i));

            frameRate(8);
        } 
        else {
            
            index++;
            i=-1;
            xPos = 90;
            yPos += 35;
        }

        i++;
    }

    if (index==2) {
        
        fill(180);
        text("3", 30, 180);
        
        fill(255);

        if (i<lines[index].length()) {
            
            if(i>=0 && i<=3){
                fill(106, 223, 242);
            }
            else
            if(i>=4 && i<=5){
                fill(166, 226, 46);
            }
            else
            if(i>=8 && i<=11){
                fill(255, 255, 0);
            }
            else{
                fill(255);
            }

            text(lines[index].charAt(i), xPos, yPos);

            xPos += textWidth(lines[index].charAt(i));

            frameRate(8);
        } 
        else {
            
            index++;
            i=-1;
            xPos = 90;
            yPos += 35;
        }

        i++;
    }
    
    if (index==3) {
        
        fill(180);
        text("4", 30, 215);
        
        fill(255);

        if (i<lines[index].length()) {
            
            if(i>=4 && i<=5){
                fill(249, 38, 114);
            }
            else
            if(i>=22 && i<=25){
                fill(131, 114, 251);
            }
            else{
                fill(255);
            }

            text(lines[index].charAt(i), xPos, yPos);

            xPos += textWidth(lines[index].charAt(i));

            frameRate(8);
        } 
        else {
            
            index++;
            i=-1;
            xPos = 90;
            yPos += 35;
        }

        i++;
    }
    
    if (index==4) {
        
        fill(180);
        text("5", 30, 250);
        
        fill(255);

        if (i<lines[index].length()) {
            
            if(i>=8 && i<=14){
                fill(249, 38, 114);
            }
            else{
                fill(255);
            }

            text(lines[index].charAt(i), xPos, yPos);

            xPos += textWidth(lines[index].charAt(i));

            frameRate(8);
        } 
        else {
            
            index++;
            i=-1;
            xPos = 90;
            yPos += 35;
        }

        i++;
    }

    if (index==5) {
        
        fill(180);
        text("6", 30, 285);
        
        fill(255);

        if (i<lines[index].length()) {

            text(lines[index].charAt(i), xPos, yPos);

            xPos += textWidth(lines[index].charAt(i));

            frameRate(8);
        } 
        else {
            
            index++;
            i=-1;
            xPos = 90;
            yPos += 35;
        }

        i++;
    }
    
    if (index==6) {
        
        fill(180);
        text("7", 30, 325);
        fill(255);

        if (i<lines[index].length()) {

            text(lines[index].charAt(i), xPos, yPos);

            xPos += textWidth(lines[index].charAt(i));

            frameRate(8);
        } 
        else {
            
            index++;
            i=-1;
            xPos = 90;
            yPos += 35;
        }

        i++;
    }
}
