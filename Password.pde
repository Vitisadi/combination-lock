int button1 = 1;
int firstButtonX = 500;
int firstButtonY = 400;
int distX = 400;
int distY = 300;
int numberSelected;
int passwordPosition = 0;
String password = "1234";
String userPassword ="";
void setup() {
size(1800,1600);
background(180);
}

void draw() { //elliples and 1-9 text
  textSize(75);
  stroke(0);
  strokeWeight(1);
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 4; y++) {
      int ellipseX = firstButtonX + distX * x;
      int ellipseY = firstButtonY + distY * y;
      int ellipseColor;
      if (dist(ellipseX, ellipseY, mouseX, mouseY) < 100) {
        ellipseColor = 255;
      } else {
        ellipseColor = 160;
      }
      fill(ellipseColor);
      ellipse(ellipseX, ellipseY, 200, 200);
      if (y*3 +x+1 <=9){
        fill(0);
        text(y * 3 + x + 1, ellipseX-25, ellipseY+25);
      }
   }
  }
  //line(firstButtonX + 1350, firstButtonY + 1300, firstButtonX + 1400, firstButtonY + 1350);
  stroke(58,203,51);
  strokeWeight(10);
  line(firstButtonX+750, firstButtonY+900, firstButtonX+790, firstButtonY+975); //checkmark
  line(firstButtonX+790, firstButtonY+975, firstButtonX+850, firstButtonY + 850);
  stroke(255, 56, 17);
  line(firstButtonX-50, firstButtonY+850, firstButtonX+50, firstButtonY + 950); //X
  line(firstButtonX-50, firstButtonY+950, firstButtonX+50, firstButtonY + 850);
  fill(0);
  text(0, firstButtonX+375, firstButtonY+925); //0

  noFill();
  rect(300, 50, 1200, 200);
  //println(dist(900, 800, mouseX, mouseY));


 

}

void resetText(){
  noStroke();
  fill(180);
  rect(0,0, 1800, 260);
}

void mousePressed() {
   textSize(200);
   for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 4; y++) {
      int ellipseX = firstButtonX + distX * x;
      int ellipseY = firstButtonY + distY * y;
      if (dist(ellipseX, ellipseY, mouseX, mouseY) < 100) {
        numberSelected = y * 3 + x + 1;
        if(numberSelected == 11){ //Fixes 0
          numberSelected = 0;
        }
        if (numberSelected != 10 && numberSelected != 12) { //userPassword String
          userPassword = userPassword + numberSelected;
        }
        println(userPassword);
        if(password.equals(userPassword)&&numberSelected == 12){ //if correct
         resetText();
         fill(22, 245, 35);
         textSize(150);
         userPassword = "abcdefg";
         text("Access Granted", 310, 215);
         return;
        }  else if (numberSelected == 12){ //if password not correct, resets password
            userPassword = "";
            resetText();
            println("wrong password");
            fill(211, 52, 21);
            textSize(140);
            text("Wrong Password", 340, 215);
            userPassword = "abcdefg";
            return;
          }
          if (numberSelected == 10){ //reset button
            println("Resetting");
            resetText();
            fill(211, 52, 21);
            textSize(150);
            text("Resetting", 500, 215);
            userPassword = "abcdefg";
            return;
          }
          else if (userPassword.length() >= 5) { //helps reset
           userPassword = ""; 
           resetText();
           println("Invalid");
           return;
          } 
               text(numberSelected, 300*userPassword.length(), 225);
       }
      }
    }
   }
