void setup()
{
  size (200, 200);
}

void draw()
{
  mario();
}

void mario()
{
  noStroke();

  //feet
  fill(#814125);
  rect(102, 130, 30, 20);
  rect(68, 130, 30, 20);

  //red shirt
  fill(#DA251C);
  rect(80, 85, 40, 50);

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

  //Hat
  fill(#DA251C);
  rect(75, 48, 60, 10);
  rect(80, 38, 40, 10);

/*I created this if statement to only produce the animation when the mouse is pressed
where Mario is*/
  if ((mousePressed == true) && (mouseX > 70 && mouseY > 35 && mouseX < 125 && mouseY < 150 ))
  {
    //Eye
    fill(20);
    stroke(0);
    line(102,63,112,68);
    line(102,68,112,63);
    
    //lips dead X(
    strokeWeight(3);
    stroke(0);
    line(120, 75, 110, 78);
  }
  
  else
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
