// To store the image of each letter:
PImage[] letters = new PImage[26];

// Constants do define each letter dimension:
int fontSize = 50;
int fontSizeWidth = 15;

// Constants to define the space between letters and lines:
int spaceBetweenChar = 60;
int spaceBetweenLine = 50;

// Constant to define the beginning position in the x-axis:
int marginLeft = 20;

// To store the text typed by the user, which will be store in a text file:
String typedText = "";

// To show which page the user is currently:
int page = 1;

// Helps to draw the close button on the top-right corner:
float radius = 7;

// Stores the initial position before start typing:
int posX;
int posY;

// File to save the text typed by the user:
PrintWriter output;

void setup(){
    
    // Setting up a window to display as much characteres as possible (based on my notebook screen):
    size(1000, 650);
    
    // Creating file:
    output = createWriter("text.txt"); 
    
    setInitialPosition();
    
    loadAlphabet();
    generateUIEnvironment();
}

// The draw loop is just used to handle the events related to the buttons (new file, save file and close):
void draw(){
    
    handleButtons();
}

// Function to setup the position of the first character on each page:
void setInitialPosition(){
    
    posX = marginLeft;
    posY = 40;
}

// Creating a simulation of a text editor UI environment:
void generateUIEnvironment(){
    
    background(255);
    
    insertCursor();
    
    generateHeader();    
    generateFooter();
   
}

// Function to handle the display and interaction with the user:
void handleButtons(){
    
    // If the mouse is over the 'New' button (white with black text):
    if(mouseX>=15 && mouseX<=65 && mouseY>=5 && mouseY<=27){
        
        // Configure rectangle:
        noStroke();
        fill(255);
        rect(15, 5, 50, 20, 5);
        
        // Configuring text button:
        fill(0);
        text("New", 40, 20);
    }
    // Otherwise (gray with white text):
    else{
        
        // Configure rectangle:
        noStroke();
        fill(155);
        rect(15, 5, 50, 20, 5);
        
        // Configuring text button:
        fill(255);
        text("New", 40, 20);
    }
    
    // If the cursor is over the 'Save' button (white with black text):
    if(mouseX>=80 && mouseX<=130 && mouseY>=5 && mouseY<=27){
        
        // Configure rectangle:
        noStroke();
        fill(255);
        rect(80, 5, 50, 20, 5);
        
        // Configuring text button:
        fill(0);
        text("Save", 105, 20);
    }
    // Otherwise (gray with white text):
    else{
        
        // Configure rectangle:
        noStroke();
        fill(155);
        rect(80, 5, 50, 20, 5);
        
        // Configuring text button:
        fill(255);
        text("Save", 105, 20);
    }
    
    // Configuring ellipse to handle on mouse over event:
    ellipseMode(RADIUS); 
    
    // If the cursor is over the 'Close'
    if(sqrt(sq(width-20-mouseX) + sq(15-mouseY)) <= radius){
        
        // Displaying a red circle:
        fill(255, 0, 0);
        noStroke();
        ellipse(width-20, 15, radius, radius);
        
        // Displaying a 'X' inside the button: 
        stroke(255);
        strokeWeight(1);
        line(width-23, 11, width-18, 18);
        line(width-23, 18, width-18, 11);
    }
    // Otherwise, just draw a red circle:
    else{
        
        fill(255, 0, 0);
        noStroke();
        ellipse(width-20, 15, radius, radius);
    }
}

// Function to handle click events and actions:
void mousePressed() {
    
    // If the mouse is over the 'New' file button:
    if (mouseX>=15 && mouseX<=65 && mouseY>=5 && mouseY<=27) {
        newFile();
    }
  
    // If the mouse is over the 'Save' file button:
    if (mouseX>=80 && mouseX<=130 && mouseY>=5 && mouseY<=27) {
        saveFile();
    } 
  
    // If the mouse is over the 'Close' window button:
    if(sqrt(sq(width-20-mouseX) + sq(15-mouseY)) <= radius){
        
        finishProgram();
    }
}

// Function to discard the current content and start a new file:
void newFile(){
    
    // Setting up first page:
    page = 1;
    
    setInitialPosition();
    
    generateUIEnvironment();    
  
    // Reopening the file (empty):
    output = createWriter("text.txt"); 
    
    // New text (to be typed):
    typedText = "";
}

// Function to handle process od saving the text inside the file:
void saveFile(){
    
    println(typedText);
    
    // Save the text inside the file:
    output.print(typedText);
    
    // Writes the remaining data to the file:
    output.flush();
    
    // Finishes the file:
    output.close();
    
    // Display a message to the user:
    fill(0, 255, 0);
    textSize(12);
    text("File saved!", 180, 20);
   
    // Restarting the variable content, otherwise, it would concatenate the old content with the new one:
    typedText = "";
}

// Closing the file properly and exiting the program:
void finishProgram(){
    
    // Writes the remaining data to the file:
    output.flush();
    
    // Finishes the file:
    output.close();
    
    exit();
}

// Configuring and displaying the 'window title':
void generateHeader(){
    
    // Setting up the backgorung:
    fill(0);
    stroke(0);
    rect(0, 0, width, 30);
    
    // Setting up the text:
    fill(255);
    textSize(14);
    textAlign(CENTER);
    text("Compixelar Edit Text", width/2, 20);
}

// Configuring and displaying the page status inside the footer:
void setPageDisplay(){

    // Setting up text:
    fill(255);
    textSize(12);
    text("Page: " + page, 40, height-10);
    
    ++page;
}

// Configuring and displaying the 'window footer':
void generateFooter(){
    
    // Setting up the background:
    fill(0);
    stroke(0);
    rect(0, height-30, width, 30);
    
    // Setting up the text:
    fill(255);
    textSize(14);
    textAlign(CENTER);
    text("Developed with    by Daniel Brito", width/2, height-10);
    fill(255, 0, 0);
    text(" ♥", width/2, height-10);
    
    setPageDisplay();
    
    // Some instructions about the program:
    text("ESC: Save and quit | TAB: New page", width-120, height-10);
}

// Loading and storing the image files (letters): 
void loadAlphabet(){
    
    for(int i=0; i<letters.length; i++){
        
        // Using some tricks using the ASCII reference to read the files from the disk:
        char ch = (char)(i+65);
        String imageFile = ch + ".png";
        letters[i] = loadImage(imageFile);
    }
}

// Displaying a static cursor to show where the next character will be placed: 
void insertCursor(){
    
    // Setting up a vertical black line:
    stroke(0);
    strokeWeight(3);
    line(posX, posY, posX, posY+fontSize+20);
}

// Smart function to 'erase' the 'insert cursor' that was left behing after typing:
void removeCursor(){
    
    // Setting up a vertical white line (which will 'override' the old one):
    stroke(255);
    strokeWeight(4);
    line(posX, posY, posX, posY+fontSize+20);
}

// Handling typing events, in this case, just lowercase letters, enter, tab and backspace:
public void keyPressed(){

    // Checking if key==SPACE:
    if(key==32){
        
        removeCursor();
        
        posX += spaceBetweenChar;
        typedText += " ";
        
        // Cheching if the user reached the end of the screen (horizontally):
        if(posX+fontSize+10>width){
            
            removeCursor();
            
            // Starting a new line:
            posX = marginLeft;
            posY += fontSize+spaceBetweenLine;
        }
        
        insertCursor();
    }
    
    // Shortcut key to create a new page:
    if(key==TAB){
        
        setInitialPosition();
        generateUIEnvironment();
        
        // Saving the current content to the file:
        output.println(typedText);
        
        // Restarting the variable content, otherwise, it would concatenate the old content with the new one:
        typedText = "";
        
        insertCursor();
    }
    
    // Shortcut key to exit the program:
    if(key==ESC){
        
        // Saving the current content to the file:
        output.println(typedText);
        
        finishProgram();
    }
    
    // Breaking lines:
    if(key==ENTER){
        
        removeCursor();
        
        // Setting up the position to insert the new character:
        posY += fontSize+spaceBetweenLine;
        posX = marginLeft;
        
        // Generating new pages if the user reaches the end of them:
        if(posY>height-fontSize){
            
            generateUIEnvironment();
            setInitialPosition();
        }
        
        insertCursor();
        
        typedText += "\n";
        
    }
    
    // Removing characters from the text:
    if(key==BACKSPACE){
        
        //if(posY+fontSize>height){
        //    return;
        //}
        
        // Checking if the current character is the first of the line:
        if(posX==20 && posY>100){
            
            removeCursor();
            
            // Going one line upwards and placing the cursor at the end of the line:
            posY = posY - spaceBetweenLine - fontSize+fontSizeWidth-15;
            
            // Notice that one line can display 16 characters:
            posX = 20 + (fontSize+10)*16;
        }
        
        removeCursor();            
        
        // Creating a rectangle to 'override' the character:
        stroke(255);
        strokeWeight(1);
        fill(255);
        rect(posX-fontSizeWidth-fontSize, posY, fontSize+10, fontSize+fontSizeWidth);
        
        // Updating the position of the cursor at the x-axis:
        posX = posX-fontSizeWidth-fontSize+5;
        
        // Checking if the user reached the margin limit:
        if(posX<20){
            
            // Setting up the position to the correct place:
            posX = marginLeft;
        }
        
        // Removing the last character of the typed string:
        if(typedText != null && typedText.length() > 0){
            
            typedText = typedText.substring(0, typedText.length()-1);
        }
        
        insertCursor();
    }
    
    // Checking if the pressed key is from 'a-z': 
    if(key>=97 && key <=122){
        
        removeCursor();

        // Checking if the user reached the end of the line:
        if(posX+fontSize+10>width){
            
            removeCursor();
            
            // Starting a new line:
            posX = marginLeft;
            posY += fontSize+spaceBetweenLine;
        }
        
        // Concatenating each letter to create the text:
        typedText += key;
        
        // Displaying the image related to the specific character:
        int charPos = key-65-32;        
        image(letters[charPos], posX, posY, fontSize, fontSize+fontSizeWidth);
        
        // Setting up the position to insert the next character:
        posX += spaceBetweenChar;
        
        // Checking if the user reached the end of the page:
        if(posY+spaceBetweenLine>height){
            
            // Creating new page:
            generateUIEnvironment();
            setInitialPosition();
        }
        
        insertCursor();
    }
}
