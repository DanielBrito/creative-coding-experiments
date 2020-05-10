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

// Configuring and printing the code line number:
void configureDefaultCodeLine(String line, int yPos){

    // Printing code line number:
    fill(180);
    text(line, 30, yPos);
    
    // Setting up the default color style:
    fill(255);    
}

// Printing and configuring a given line character:
void printCharacter(Character letter){
    
    // Configuring the character to be printed:
    text(letter, xPos, yPos);

    // Setting up the position (x-axis) of the next character:
    xPos += textWidth(letter);

    // Delay between each printed character:
    frameRate(8);
}

void configureNewLine(){

    // Setting up next line:
    index++;
    
    // Restarting to the first line character:
    i=0;
    
    // Setting up the position of the new line:
    xPos = 90;
    yPos += 35;
}

void draw() {

    // Configuring the text:
    fill(255);
    textSize(25);

    // Printing the lines separetely, because each one has different styles:
    
    if (index==0) {
        
        configureDefaultCodeLine("1", 110);
        
        // Printing each character of a given line:
        if (i<lines[index].length()) {
            
            // Changing color based on the syntax:
            if(i>=0 && i<=7){
                fill(249, 38, 114);
            }
            else{
                fill(237, 223, 116);
            }
            
            printCharacter(lines[index].charAt(i++));
        } 
        // The line was completely printed
        else {
            
            configureNewLine();
        }
    }
    
    // The next conditions follow the same idea:

    if (index==1) {
        
        configureDefaultCodeLine("2", 145);

        if (i<lines[index].length()) {
            
            printCharacter(lines[index].charAt(i++));
        } 
        else {
            
            configureNewLine();
        }
    }

    if (index==2) {
        
        configureDefaultCodeLine("3", 180);

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

            printCharacter(lines[index].charAt(i++));
        } 
        else {
            
            configureNewLine();
        }
    }
    
    if (index==3) {
        
        configureDefaultCodeLine("4", 215);

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

            printCharacter(lines[index].charAt(i++));
        } 
        else {
            
            configureNewLine();
        }
    }
    
    if (index==4) {
        
        configureDefaultCodeLine("5", 250);

        if (i<lines[index].length()) {
            
            if(i>=8 && i<=14){
                fill(249, 38, 114);
            }
            else{
                fill(255);
            }

            printCharacter(lines[index].charAt(i++));
        } 
        else {
            
            configureNewLine();
        }
    }

    if (index==5) {
        
        configureDefaultCodeLine("6", 285);

        if (i<lines[index].length()) {

            printCharacter(lines[index].charAt(i++));
        } 
        else {
            
            configureNewLine();
        }
    }
    
    if (index==6) {
        
        configureDefaultCodeLine("7", 325);

        if (i<lines[index].length()) {

            printCharacter(lines[index].charAt(i++));
        } 
        else {
            
            configureNewLine();
        }
    }
}
