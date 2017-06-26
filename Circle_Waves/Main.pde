final int num = 100;

float angle, angle_o;
float angle_rate, angle_o_rate;
float n_seed, n_seed_o, y_seed, y_seed_o, s_seed;
float hue, hue_o;

Circle[] c;

void setup() {
  fullScreen();
  background(0);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  
  c = new Circle[num];
  
  y_seed_o = random(100);
  y_seed = y_seed_o;
  
  for(int i = 0; i < num; i++){
    c[i] = new Circle(i);
  }
  
  angle_rate = random(0.01, 0.075);
  angle_o_rate = random(0.01, 0.1);
  angle_o = random(TWO_PI);
  angle = angle_o;
  n_seed_o = random(10);
  n_seed = n_seed_o;
  s_seed = 0;
  
  hue_o = (int)random(360);
}

void draw() {  
  fill(360, 100, 0, 10);
  rect(0, 0, width, height);
  
  spin_screen(0.005);
  
  hue = 100/num;
  
  for(int i = 0; i < num; i++){
    fill((hue_o + hue*i) % 360, 100, 100, 200);
    c[i].run();
    angle += angle_rate;
    n_seed += 0.005;
    s_seed += 0.003;
    y_seed += 0.001;
  }
  angle_o += angle_o_rate;
  angle = angle_o;
  n_seed_o += 0.03;
  n_seed = n_seed_o;
  y_seed_o += 0.001;
  y_seed = y_seed_o;
  s_seed = 0;
  hue_o += 0.3;
}

void spin_screen(float w){
  translate(width*0.5, height*0.5);
  rotate(frameCount*w);
  translate(-width*0.5, -height*0.5);
}

void mouseReleased() {
  setup();
}