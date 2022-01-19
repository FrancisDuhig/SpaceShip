boolean upArrow, downArrow, leftArrow, rightArrow;
PImage spaceship;
PVector location;
PVector velocity;
PVector direction;



void setup(){
   size(1000,760);
   imageMode(CENTER);
   location = new PVector(width/2, height/2); //center of screen
   velocity = new PVector(0, 0); // starting velocity set to 0.
   direction = new PVector(0, -0.1); // used in rotate
   spaceship = loadImage("Spaceship1new.png"); // had to rotate the image 90 degrees to get direction to work.
   spaceship.resize(50, 50);
}

void draw(){
   background(0); 
   render();
   movement();
   spacewarp();
}

void render(){
   pushMatrix(); //starts a new environment
   translate(location.x, location.y); // Moves the origin of the spaceship image to location.x location.y
   rotate(direction.heading()); // THIS TOOK ME FOREVER TO FIND AND WORKOUT!!! DKAWJDIAWUDIAWNKDAJD(*)&*()*()DAJKM!!
   image(spaceship, 0, 0); //spaceship rendering at 0,0 due to translate
   popMatrix(); // finishes new environment
}
  
void movement(){
   location.add(velocity); //adding velocity to locations
   velocity.limit(5); // used your velocity limiter from concept.
    
   if (upArrow) velocity.add(direction); // Forward direction spaceship is facing
   if (downArrow) velocity.sub(direction); // I might change this so spaceship cannot go backwards
   if (leftArrow) direction.rotate(-radians(5)); //amount of angle change with key press
   if (rightArrow) direction.rotate(radians(5));
}

/** spacewarp()
    spacewarp() is a method that allows the spaceship to traverse from one side of the screen to the other
    on both the X and Y axis. Once either the X or Y parameter is satisfied, the X or Y location is changed.
    It utilizes the height and width in-built variables to detect edges as well as
    adding or subtracting an amount of pixels to make the transition look seamless.
**/

void spacewarp(){
 // spacewarp X-axis
 if (location.x-spaceship.width < -75) location.x = width+25;
 if (location.x-spaceship.width > width) location.x = 0;
 
 // spacewarp Y-axis
 if (location.y-spaceship.height < -75) location.y = height +25;
 if (location.y-spaceship.height > height) location.y = 0;

}
  
  

void keyPressed(){ // Used booleans for key inputs
   if (keyCode == UP) upArrow = true;
   if (keyCode == DOWN) downArrow = true;
   if (keyCode == LEFT) leftArrow = true;
   if (keyCode == RIGHT) rightArrow = true;
}

void keyReleased(){
   if (keyCode == UP) upArrow = false;
   if (keyCode == DOWN) downArrow = false;
   if (keyCode == LEFT) leftArrow = false;
   if (keyCode == RIGHT) rightArrow = false;
}
  
