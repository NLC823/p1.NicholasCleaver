void setup(){
  size(400, 600);
  background(165);
}

// COLORS:
// Main Background: (208, 220, 215)
// Text: (63, 64, 63)
// Red (214, 50, 48)
// Green (71, 108, 52)
// Yellow (254, 165, 32)
// Blue (56, 112, 168)

// ----------------------------------------------------------------------------------------

String State = "home";
float Power = 75;
String Input = "--:--";
String Percent = "--";
int Timer_base = 0;
int Timer_total = 0;
float progress = 0;
int Seconds = 0;
int Minutes = 0;

// ----------------------------------------------------------------------------------------

void draw(){
  if (State.equals("home")){
    draw_home();
  }
  else if (State.equals("Power")){
    draw_power();
  }
  else if (State.equals("Timer")){
    draw_timer();
  }
}

// ----------------------------------------------------------------------------------------

void draw_home(){
  draw_main_frame();
  draw_home_screen();
}

void draw_power(){
  draw_main_frame();
  draw_power_screen();
}

void draw_timer(){
  draw_main_frame();
  draw_timer_screen();
}

// ----------------------------------------------------------------------------------------

void draw_main_frame(){
  // Shapes
  stroke(80);
  fill(208, 220, 215);
  rect(25, 50, 350, 500, 70);
  ellipse(200, 60, 120, 100);
  ellipse(200, 540, 120, 100);
  
  // Text
  fill(63, 64, 63);
  textSize(30);
  text("Open", 163, 550);
  
  // Modular
  int h = hour();
  int m = minute();
  int s = second();
  String time;
  String seconds;
  if (s < 10){
    seconds = "0" + str(s);
  }
  else{
    seconds = str(s);
  }
  if (m < 10) {
    time = str(h) + ":0" + str(m);
  }
  else{
    time = str(h) + ":" + str(m);
  }
  
  textSize(28);
  text(time, 155, 67);
  textSize(12);
  text(seconds, 236, 56);
}

// ----------------------------------------------------------------------------------------

void draw_timer_screen(){
  String min_display = "";
  String sec_display = "";
  int width = 0;
  int time = millis();
  if (time - Timer_base >= 1000){
    if (Seconds > 0){
      Seconds--;
    }
    else if (Minutes > 0){
      Minutes--;
      Seconds = 59;
    }
    else{
      State = "home";
    }
    Timer_base = time;
    progress++;
  }
  
  if (Minutes < 10){
    min_display = "0" + str(Minutes);
  }
  else{
    min_display = str(Minutes);
  }
  if (Seconds < 10){
    sec_display = "0" + str(Seconds);
  }
  else{
    sec_display = str(Seconds);
  }
  fill(40, 41, 40);
  rect(50, 195, 300, 20); //progress bar
  width = int((progress / Timer_total) * 300); 
  fill(71, 108, 52);
  rect(50, 195, width, 20); //progress bar green part
  fill(208, 220, 215);
  rect(75, 230, 250, 80); //cancel
  
  fill(208, 220, 215);
  rect(55, 340, 130, 60); //+10 sec
  rect(215, 340, 130, 60); // +30 sec
  rect(55, 420, 290, 60); // +1 min
  
  // Text
  fill(63, 64, 63);
  //numbers
  textSize(18);
  text("+10 Seconds", 62, 377);
  text("+30 Seconds", 222, 377);
  textSize(20);
  text("+1 Minute", 145, 458);
  textSize(75);
  text(min_display + ":" + sec_display, 100, 175);
  textSize(40);
  fill(214, 50, 48);
  text("Cancel", 135, 280);
}

// ----------------------------------------------------------------------------------------

void draw_power_screen(){
  // Shapes
  stroke(80);
  fill(208, 220, 215);
  rect(65, 220, 270, 195); //main box
  //lines for seperation
  line(155, 220, 155, 415); //left vertical
  line(245, 220, 245, 415); //right vertical
  line(65, 285, 335, 285); //top horizontal
  line(65, 350, 335, 350); //second horizontal
  line(155, 480, 245, 480); //bottom horizontal
  rect(55, 415, 100, 85); // save
  rect(245, 415, 100, 85); // clear
  rect(40, 165, 80, 45); // cancel
  
  // Text
  fill(63, 64, 63);
  //numbers
  textSize(26);
  text("1", 100, 260);
  text("2", 190, 260);
  text("3", 280, 260);
  text("4", 100, 325);
  text("5", 190, 325);
  text("6", 280, 325);
  text("7", 100, 390);
  text("8", 190, 390);
  text("9", 280, 390);
  text("0", 190, 455);
  //percent
  textSize(40);
  if (Percent.equals("100")){
    text(Percent + " %", 148, 185);
  }
  else {
    text(Percent + " %", 168, 185);
  }
  //misc.
  textSize(26);
  text("Enter Power:", 135, 140);
  textSize(16);
  text("Current: " + str(int(Power)) + "%", 157, 210);
  textSize(28);
  fill(71, 108, 52);
  text("Save", 74, 465);
  fill(214, 50, 48);
  text("Clear", 260, 465);
  textSize(16);
  text("Cancel", 55, 193);
  
  // Modular 
}

// ----------------------------------------------------------------------------------------

void draw_home_screen(){
  // Shapes
  stroke(80);
  fill(208, 220, 215);
  rect(65, 220, 270, 195); //main box
  rect(125, 185, 150, 35); //change power box
  fill(40, 41, 40);
  rect(125, 180, 150, 5); //power indicator
  fill(208, 220, 215);
  //lines for seperation
  line(155, 220, 155, 415); //left vertical
  line(245, 220, 245, 415); //right vertical
  line(65, 285, 335, 285); //top horizontal
  line(65, 350, 335, 350); //second horizontal
  line(155, 480, 245, 480); //bottom horizontal
  rect(55, 415, 100, 85); // start
  rect(245, 415, 100, 85); // clear
  
  // Text
  fill(63, 64, 63);
  //power
  textSize(20);
  text("Change Power", 132, 208);
  //numbers
  textSize(26);
  text("1", 100, 260);
  text("2", 190, 260);
  text("3", 280, 260);
  text("4", 100, 325);
  text("5", 190, 325);
  text("6", 280, 325);
  text("7", 100, 390);
  text("8", 190, 390);
  text("9", 280, 390);
  text("0", 190, 455);
  //start & stop
  textSize(28);
  fill(71, 108, 52);
  text("Start", 70, 465);
  fill(214, 50, 48);
  text("Clear", 260, 465);
  //input
  fill(63, 64, 63);
  textSize(42);
  text(Input, 142, 150);
  
  // Modular
  //power
  if(Power >= 67){
    fill(214, 50, 48);
  }
  else if(Power >= 33){
    fill(254, 165, 32);
  }
  else{
    fill(56, 112, 168);
  }
  float x_dist = (Power / 100) * 150;
  noStroke();
  rect(125, 180, x_dist, 5);  
}

// ----------------------------------------------------------------------------------------

void mousePressed(){
  int temp = -1; //holds a code for what action to do based on where the screen was pressed
  if (State.equals("home")){
    if(mouseX >= 65 && mouseX < 155 && mouseY >= 220 && mouseY < 285){ //1
      temp = 1;
    }
    else if (mouseX >= 155 && mouseX < 245 && mouseY >= 220 && mouseY < 285){ //2
      temp = 2;
    }
    else if (mouseX >= 245 && mouseX < 335 && mouseY >= 220 && mouseY < 285){ //3
      temp = 3;
    }
    else if (mouseX >= 64 && mouseX < 155 && mouseY >= 285 && mouseY < 350){ //4
      temp = 4;
    }
    else if (mouseX >= 155 && mouseX < 245 && mouseY >= 285 && mouseY < 350){ //5
      temp = 5;
    }
    else if (mouseX >= 245 && mouseX < 335 && mouseY >= 285 && mouseY < 350){ //6 
      temp = 6;
    }
    else if (mouseX >= 64 && mouseX < 155 && mouseY >= 350 && mouseY < 415){ //7
      temp = 7;
    }
    else if (mouseX >= 155 && mouseX < 245 && mouseY >= 350 && mouseY < 415){ //8
      temp = 8;
    }
    else if (mouseX >= 245 && mouseX < 335 && mouseY >= 350 && mouseY < 415){ //9
      temp = 9;
    }
    else if (mouseX >= 155 && mouseX < 245 && mouseY >= 415 && mouseY < 480){ //0
      temp = 0;
    }
    else if (mouseX >= 55 && mouseX < 155 && mouseY >= 415 && mouseY < 500){ //start
      if (Input.startsWith("--:--")) {
        Seconds = 0;
        Minutes = 0;
      }
      else if (Input.startsWith("--:-")) {
        Seconds = int(("" + Input.charAt(4)));
        Minutes = 0;
      }
      else if (Input.startsWith("--:")) {
        Input = "" + Input.charAt(3) + Input.charAt(4);
        Seconds = int(Input);
        Minutes = 0;
      }
      else if (Input.startsWith("-")) {
        Minutes = int(("" + Input.charAt(1)));
        Input = "" + Input.charAt(3) + Input.charAt(4);
        Seconds = int(Input);
      }
      else{
        Minutes = int(("" + Input.charAt(0) + Input.charAt(1)));
        Input = "" + Input.charAt(3) + Input.charAt(4);
        Seconds = int(Input);
      }
      Input = "--:--";
      Timer_base = millis();
      Timer_total = (60 * Minutes) + Seconds;
      State = "Timer";
    }
    else if (mouseX >= 245 && mouseX < 345 && mouseY >= 415 && mouseY < 500){ //clear
      Input = "--:--";
    }
    else if (mouseX >= 125 && mouseX < 275 && mouseY >= 185 && mouseY < 220){ //change power
      State = "Power";
    }
    if(temp >= 0 && temp <= 9){ // number was entered
      if (Input.equals("--:--") && temp == 0){
        Input = "--:--";
      }
      else if (Input.startsWith("--:--")) {
        Input = "--:-" + str(temp);
      }
      else if (Input.startsWith("--:-")) {
        Input = "--:" + Input.charAt(4) + str(temp);
      }
      else if (Input.startsWith("--:")) {
        Input = "-" + Input.charAt(3) + ":" + Input.charAt(4) + str(temp);
      }
      else if (Input.startsWith("-")) {
        Input = "" + Input.charAt(1) + Input.charAt(3) + ":" + Input.charAt(4) + str(temp);
      }
    }
  }
  else if (State.equals("Power")){
    if(mouseX >= 65 && mouseX < 155 && mouseY >= 220 && mouseY < 285){ //1
      temp = 1;
    }
    else if (mouseX >= 155 && mouseX < 245 && mouseY >= 220 && mouseY < 285){ //2
      temp = 2;
    }
    else if (mouseX >= 245 && mouseX < 335 && mouseY >= 220 && mouseY < 285){ //3
      temp = 3;
    }
    else if (mouseX >= 64 && mouseX < 155 && mouseY >= 285 && mouseY < 350){ //4
      temp = 4;
    }
    else if (mouseX >= 155 && mouseX < 245 && mouseY >= 285 && mouseY < 350){ //5
      temp = 5;
    }
    else if (mouseX >= 245 && mouseX < 335 && mouseY >= 285 && mouseY < 350){ //6 
      temp = 6;
    }
    else if (mouseX >= 64 && mouseX < 155 && mouseY >= 350 && mouseY < 415){ //7
      temp = 7;
    }
    else if (mouseX >= 155 && mouseX < 245 && mouseY >= 350 && mouseY < 415){ //8
      temp = 8;
    }
    else if (mouseX >= 245 && mouseX < 335 && mouseY >= 350 && mouseY < 415){ //9
      temp = 9;
    }
    else if (mouseX >= 155 && mouseX < 245 && mouseY >= 415 && mouseY < 480){ //0
      temp = 0;
    }
    else if (mouseX >= 55 && mouseX < 155 && mouseY >= 415 && mouseY < 500){ //save
      if (Percent.startsWith("--")) {
        Percent = "--";
        State = "home";
      }
      else if (Percent.startsWith("-")) {
        Percent = "" + Percent.charAt(1);
        Power = int(Percent);
        Percent = "--";
        State = "home";
      }
      else {
        Power = int(Percent);
        Percent = "--";
        State = "home";
      }
    }
    else if (mouseX >= 245 && mouseX < 345 && mouseY >= 415 && mouseY < 500){ //clear
      Percent = "--";
    }
    else if (mouseX >= 40 && mouseX < 120 && mouseY >= 165 && mouseY < 210){ //cancel
      Percent = "--";
      State = "home";
    }
    if(temp >= 0 && temp <= 9){ // number was entered
      if (Percent.startsWith("--") && temp != 0) {
        Percent = "-" + str(temp);
      }
      else if (Percent.startsWith("-")) {
        Percent = "" + Percent.charAt(1) + str(temp);
      }
      else if (Percent.startsWith("10") && temp == 0){
        Percent = "100";
      }
    }
  }
  else if (State.equals("Timer")){
    if (mouseX >= 75 && mouseX < 325 && mouseY >= 230 && mouseY < 310){ //cancel
      progress = 0;
      State = "home";
    }
    else if (mouseX >= 55 && mouseX < 185 && mouseY >= 340 && mouseY < 400){ // +10 sec
      if (Minutes < 99){
        Timer_total += 10;
        if (Seconds < 50){
          Seconds += 10;
        }
        else{
          Minutes += 1;
          Seconds -= 50;
        }
      }
    }
    else if (mouseX >= 215 && mouseX < 345 && mouseY >= 340 && mouseY < 400){ // +30 sec
      if(Minutes < 99){
        Timer_total += 30;
        if (Seconds < 30){
          Seconds += 30;
        }
        else{
          Minutes += 1;
          Seconds -= 30;
        }
      }
    }
    else if (mouseX >= 55 && mouseX < 345 && mouseY >= 420 && mouseY < 480){ // +1 min
      Timer_total += 60;
      if (Minutes < 99){
        Minutes += 1;
      }
    }
  }
}
