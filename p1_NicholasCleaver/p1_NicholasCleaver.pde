void setup(){
  size(400, 600);
  background(150);
}

String state = "home";

void draw(){
  if (state.equals("home")){
    noStroke();
    rect(25, 50, 350, 500, 70);
  }
}
