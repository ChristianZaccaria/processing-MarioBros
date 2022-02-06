/*
Name : Christian Zaccaria
 Student Number: W20092351
 Programme Name: Software Systems Development Year 1
 
 Brief description of the animation achieved: Mario Bros. Theme song playing.
 Background image moving endlessly. Change character from Mario to Luigi or Waluigi
 by pressing and holding their respective keys, L for Luigi, W for Waluigi.
 Hurt character when left clicking on it. Pause and start game with Spacebar key.
 
 Known bugs/problems: When I pause the game, Music does not stop too.
 
YouTube and processing.org helped me with the animations, the specific links
are on the report.
 */


//Declaring global variables
PImage backgroundImage;    
int backgroundX, backgroundY;

import processing.sound.*;   //imports the library, enabling us to import Sounds
SoundFile marioTheme;       //variable for theme song

void setup()
{
  //Message to User
  print("Hi there! Before you do anything, turn ON the volume!");
  println();
  println("Try the following Animations:");
  println("- Change character to Luigi or Waluigi by keeping pressed the L or W key.");
  println("- Hurt Character: Left click on the character, you can also keep the button pressed.");
  println("- Pause game: press spacebar key. To continue the game, press the spacebar key again.");


  size (800, 550); //dimensions of display
  
  marioTheme = new SoundFile(this, "themeSong.mp3"); //here I selected the .mp3 file
  marioTheme.loop(); //this repeats the song until the program is closed.

  backgroundImage = loadImage("./images/bg.png");  //loading main background image
}


void draw() //function where animations are actioned
{ 
  background(0); //background behind the text "by: Christian Zaccaria"
  fill(255, 60, 60);    //text colour
  textSize(20);
  text("By: CHRISTIAN ZACCARIA", 280, 532);
  
  backgroundSetup(); //calling function I created for the background

  cursorEffect();

  translate(0, 320); //changes the position of the Mario character
  mario(); //calling function I created for Mario
}

//--------------------------------------------------

void cursorEffect()
{
  strokeWeight(10);
  stroke(#FFE800);
  line(mouseX, mouseY, pmouseX, pmouseY);  //Yellow dot following the cursor
}


//------------------------------------------------------------------------
void backgroundSetup()
{
  image(backgroundImage, backgroundX, backgroundY); //mainbackground image positioning

  //code below will add another image behind it to keep the background moving
  image(backgroundImage, backgroundX + backgroundImage.width, backgroundY);
  backgroundX = backgroundX - 2; //speed of the background moving set to -2

  /*This if statement is saying, if background ends, reset it and keep showing it
   again and again*/
  if (backgroundX < -backgroundImage.width)
  {
    backgroundX = 0;
  }
}

//-----------------------------------------------------------------
void mario()
{
  noStroke();

  //feet
  fill(#814125);
  rect(102, 130, 30, 20);
  rect(68, 130, 30, 20);

  //red shirt Mario, green shirt Luigi, or purple shirt Waluigi
  fill(#DA251C);
  rect(80, 85, 40, 50);

  //change shirt to Luigi's green one, or Waluigi's purple one
  if (keyPressed) {
    if (key == 'l' || key == 'L') { //keep pressed the L key to change the character to Luigi
      fill(#39AF3C);
      rect(80, 85, 40, 50);
    } else if (key == 'w' || key == 'W') {  //keep pressed the W key to change the character to Waluigi
      fill(#7A1FB9);
      rect(80, 85, 40, 50);
    } else {    //Stays as Mario
      fill(#DA251C);
      rect(80, 85, 40, 50);
    }
  }


  //blue shirt
  fill(#494ED0);
  rect(80, 110, 40, 25);

  //blue strings from blue shirt
  fill(#494ED0);
  rect(90, 85, 7, 25);
  rect(103, 85, 7, 25);

  //two yellow buttons
  fill(#FDEC23);
  circle(93, 112, 7);
  circle(107, 112, 7);

  //Head
  fill(#EEBF8B);
  ellipse(100, 70, 50, 50);

  //Hat Mario, Luigi or Waluigi
  //original hat
  fill(#DA251C);
  rect(75, 48, 60, 10);
  rect(80, 38, 40, 10);

  //change hat to Luigi's or Waluigi's
  if (keyPressed) {
    if (key == 'l' || key == 'L') { //keep pressed the L key to change the character to Luigi
      fill(#39AF3C);
      rect(75, 48, 60, 10);
      rect(80, 38, 40, 10);
    } else if (key == 'w' || key == 'W') {  //keep pressed the W key to change the character to Waluigi
      fill(#7A1FB9);
      rect(75, 48, 60, 10);
      rect(80, 38, 40, 10);
    } else {    //Stays as Mario
      fill(#DA251C);
      rect(75, 48, 60, 10);
      rect(80, 38, 40, 10);
    }
  }

  /*I created this if statement to only produce the animation when the
   left button on the mouse is pressed where the character is*/
  if ((mousePressed == true) && (mouseButton == LEFT) && (mouseX > 70 && mouseY > 355 && mouseX < 125 && mouseY < 470 ))
  {
    //Eye
    fill(20);
    stroke(0);
    strokeWeight(3);
    line(102, 63, 112, 68);
    line(102, 68, 112, 63);

    //lips dead X(
    strokeWeight(3);
    stroke(0);
    line(120, 75, 110, 78);

    //tongue out
    stroke(#FF1C41);
    strokeWeight(4);
    point(112, 80);
  } else
  {
    //Eye
    fill(20);
    square(104, 62, 8);

    //lips 
    strokeWeight(3);
    stroke(0);
    line(120, 75, 110, 75);
  }
}
//------------------------------------------------------------------

//this if statement is to pause or start the animation by pressing the spacebar key
void keyPressed()
{
  final int pause = key;

  if (pause == ' ') //setting spacebar to pause the game
    if (looping) { 
      noLoop();
    } else {      
      loop();
    } //Previous key, spacebar again to continue the game
}
