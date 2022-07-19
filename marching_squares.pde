float[][] field;
int rez =5;
int rows, cols;
float increment = 0.1;
float zoff;

OpenSimplexNoise noise;

void setup(){
  size(800,800);
  noise = new OpenSimplexNoise();
  cols = 1 + width / rez;
  rows = 1 + height / rez; 
  field = new float[cols][rows];
}

void draw() {
  background(0);
  float xoff = 0.0;
  for (int i = 0; i < cols; i++) {
    xoff += increment;
    float yoff = 0.0;
    for (int j = 0; j < rows; j++) {
      field[i][j] = (float)noise.eval(xoff, yoff,zoff);
      yoff += increment;
    }
  }
  zoff += 0.01;

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      stroke(30,map(field[i][j],-1,1,80,255),30);
      if(map(field[i][j],-1,1,0,255)<122)
      stroke(30,30,map(field[i][j],-1,1,80,255));
      strokeWeight(rez);
      square(i*rez,j*rez,0);
    }
  }
  
  for (int i = 0; i < cols-1; i++) {
    for (int j = 0; j < rows-1; j++) {
      float y = j * rez;       float x = i * rez;

      float aM = .5;
      /*float bM = (field[i][j+1]+field[i+1][j+1])/2;
      float cM = (field[i+1][j]+field[i+1][j+1])/2;
      float dM = (field[i][j]+field[i+1][j])/2;*/
      
      PVector a = new PVector(x+rez*aM,  y      );
      PVector b = new PVector(x+rez,  y+rez*aM  );
      PVector c = new PVector(x+rez*aM,  y+rez  );
      PVector d = new PVector(x    ,  y+rez*aM  );
      
      stroke(255);
      strokeWeight(1);
      float A = field[i][j];float B = field[i+1][j];float C = field[i+1][j+1];float D = field[i][j+1];
      //side:     d,b
      //top-bot:  a,c
      //           d      A        a          B          b            C        c        D           d
      switch(state(round(A),round(B),round(C),round(D))){
      case (1):
      line(c,d);
        break;
      case (2):
      line(b,c);
        break;
      case (3):
      line(b,d);
        break;
      case (4):
      line(a,b);
        break;
      case (5):
      line(a,d);
      line(b,c);
        break;
      case (6):
      line(a,c);
        break;
      case (7):
      line(a,d);
        break;
      case (8):
      line(a,d);
        break;
      case (9):
      line(a,c);
        break;
      case (10):
      line(c,d);
      line(a,b);
        break;
      case (11):
      line(a,b);
        break;
      case (12):
      line(b,d);
        break;
      case (13):
      line(b,c);
        break;
      case (14):
      line(d,c);
        break;
      }
      switch(state(round(A),round(B),round(C),round(D))){
      case (1):
      line(c,d);
        break;
      case (2):
      line(b,c);
        break;
      case (3):
      line(b,d);
        break;
      case (4):
      line(a,b);
        break;
      case (5):
      line(a,d);
      line(b,c);
        break;
      case (6):
      line(a,c);
        break;
      case (7):
      line(a,d);
        break;
      case (8):
      line(a,d);
        break;
      case (9):
      line(a,c);
        break;
      case (10):
      line(c,d);
      line(a,b);
        break;
      case (11):
      line(a,b);
        break;
      case (12):
      line(b,d);
        break;
      case (13):
      line(b,c);
        break;
      case (14):
      line(d,c);
        break;
      }
      switch(state(round(-1*A),round(-1*B),round(-1*C),round(-1*D))){
      case (1):
      line(c,d);
        break;
      case (2):
      line(b,c);
        break;
      case (3):
      line(b,d);
        break;
      case (4):
      line(a,b);
        break;
      case (5):
      line(a,d);
      line(b,c);
        break;
      case (6):
      line(a,c);
        break;
      case (7):
      line(a,d);
        break;
      case (8):
      line(a,d);
        break;
      case (9):
      line(a,c);
        break;
      case (10):
      line(c,d);
      line(a,b);
        break;
      case (11):
      line(a,b);
        break;
      case (12):
      line(b,d);
        break;
      case (13):
      line(b,c);
        break;
      case (14):
      line(d,c);
        break;
      }
      switch(state(ceil(-1*A),ceil(-1*B),ceil(-1*C),ceil(-1*D))){
      case (1):
      line(c,d);
        break;
      case (2):
      line(b,c);
        break;
      case (3):
      line(b,d);
        break;
      case (4):
      line(a,b);
        break;
      case (5):
      line(a,d);
      line(b,c);
        break;
      case (6):
      line(a,c);
        break;
      case (7):
      line(a,d);
        break;
      case (8):
      line(a,d);
        break;
      case (9):
      line(a,c);
        break;
      case (10):
      line(c,d);
      line(a,b);
        break;
      case (11):
      line(a,b);
        break;
      case (12):
      line(b,d);
        break;
      case (13):
      line(b,c);
        break;
      case (14):
      line(d,c);
        break;
      }
    }
  }
}

int state(int a, int b,int c, int d){
  return a*8+b*4+c*2+d;
}

void line(PVector v1, PVector v2){
  line(v1.x,v1.y,v2.x,v2.y);
}

void mouseDragged(){
  zoff+=((mouseX+mouseY)*0.000005);
}

void mouseWheel(MouseEvent event) {
  increment += 0.01*event.getCount();
}
