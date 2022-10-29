import processing.dxf.*;


import controlP5.*;
import peasy.*;
PeasyCam cam;
ControlP5 bar;

 float tall1;
float bottomRadius1;
float topRadius1;
 float k,r,g,b;
 float sides2,bnoise;
 int sides1=round(sides2);//有bug，int与round都失效了（在3d中无法显示图形）

void setup() {
  size(800, 800, P3D);
 
  background(0);
    cam = new PeasyCam(this, 1800);
  UI();
}

void draw() {
   beginRaw(DXF,"output.dxf");
  background(0);
  lights();
  fill(255);
  translate(100, -50, 600);
  drawCylinder(topRadius1, bottomRadius1, tall1,4);//此处的100是边数（见开头的sides1）
  endRaw();
}

void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
   UIShow();
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float s=2;
  float r1=abs(map(r+i*s,2,r+sides*s,-255,255));
   float g1=abs(map(g+i*s,2,g+sides*s,-255,255));
    float b1=abs(map(b+i*s,2,b+sides*s,-255,255));
    fill(r,g,b);
    vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
    //vertex(bottomRadius * cos(angle)-5*noise(i)*pow(-1,i), tall/2, bottomRadius * sin(angle)+5*noise(i)*pow(-1,i));
    vertex(bottomRadius * cos(angle)*map(noise(i),0,1,1,1.1)*bnoise, tall/2, bottomRadius * sin(angle)*map(noise(i),0,1,1,1.1)*bnoise);
    angle += angleIncrement;   
  }
  endShape();//底部开口圆锥
  
  
    beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides; i++) {
    vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
    vertex(topRadius * cos(angle +angleIncrement), 0, topRadius * sin(angle + angleIncrement));
    vertex(bottomRadius * cos(angle), -tall, bottomRadius * sin(angle));
    vertex(bottomRadius * cos(angle+angleIncrement), -tall, bottomRadius * sin(angle+angleIncrement));
    angle += angleIncrement;  
  }  
  endShape();//中间相接的圆锥绘制
  
  
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides +1; i++) {
    vertex(bottomRadius * cos(angle), -tall, bottomRadius * sin(angle));
    vertex(topRadius * cos(angle)-k*sin(pow(-1,i)), -2*tall, topRadius * sin(angle)-k*cos(pow(-1,i+1)));
    angle += angleIncrement;
  }
  endShape();//顶部开口绘制圆锥

}
