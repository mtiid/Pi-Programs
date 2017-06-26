class Circle {

  PVector loc;

  int _idx;
  float radius;
  float mult, add, limit;

  Circle(int idx) {
    _idx = idx;
    mult = 0;
    add = 1;
    limit = height * 0.5;
  }

  void update() {
    float x = float((width/num)*_idx);
    float y = height*0.5 +  map(noise(y_seed), 0, 1, -height*0.25, height*0.25) + mult * (sin(angle)*cos(angle*2.5)*sin(angle*0.75));
    loc = new PVector(x, y);
    
    if(mult >= limit){
      mult = limit;
      add *= -1;
    }
    if(mult <= 0){
      mult = 0;
      add *= -1;
    }
    
    mult += add;
  }

  void display() {
    radius = map(noise(n_seed, s_seed), 0, 1, 5, 30);
    ellipse(loc.x, loc.y, radius, radius);
  }

  void run() {
    update();
    display();
  }
}