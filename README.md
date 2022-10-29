# wxk-project5

![image](https://github.com/stream00/wxk-project5/blob/main/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202022-10-29%20235112.jpg)
![image](https://github.com/stream00/wxk-project5/blob/main/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202022-10-29%20235143.jpg)
![image](https://github.com/stream00/wxk-project5/blob/main/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202022-10-29%20235201.jpg)
![image](https://github.com/stream00/wxk-project5/blob/main/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202022-10-29%20235323.jpg)
![image](https://github.com/stream00/wxk-project5/blob/main/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202022-10-29%20235458.jpg)
```java

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
  drawCylinder(topRadius1, bottomRadius1, tall1,100);//此处的100是边数（见开头的sides1）
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

int canvasLeftCornerX = 30;
int canvasLeftCornerY = 60;

/*import controlP5.*;
import peasy.*;
//import nervoussystem.obj.*;
PeasyCam cam;
ControlP5 bar;*/

void s1() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 2000);
  UI();
}

void d1() {
  background(51);
  box(15);
  UIShow();
}



void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));
  int barSize = 200;
  int barHeight = 20;
  int barInterval = barHeight + 10;
  bar.addSlider("tall1", 0, 500,255, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("高度");
  bar.addSlider("bottomRadius1", 0, 1000, 500, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("下底面半径");
  bar.addSlider("topRadius1", 0, 1000, 500, canvasLeftCornerX, canvasLeftCornerY+barInterval*3, barSize, barHeight).setLabel("上底面半径");
  bar.addSlider("r", 0, 255, 180, canvasLeftCornerX, canvasLeftCornerY+barInterval*4, barSize, barHeight).setLabel("颜色R");
  bar.addSlider("g", 0, 255, 255, canvasLeftCornerX, canvasLeftCornerY+barInterval*5, barSize, barHeight).setLabel("颜色G");
  bar.addSlider("b", 0, 255, 255,canvasLeftCornerX, canvasLeftCornerY+barInterval*6, barSize, barHeight).setLabel("颜色B");
    bar.addSlider("sids2", 0, 200, 20,canvasLeftCornerX, canvasLeftCornerY+barInterval*7, barSize, barHeight).setLabel("边数");
     bar.addSlider("bnoise", 1,1.5,1.2,canvasLeftCornerX, canvasLeftCornerY+barInterval*8, barSize, barHeight).setLabel("低边noise");
     bar.addSlider("k", 1,50,15,canvasLeftCornerX, canvasLeftCornerY+barInterval*9, barSize, barHeight).setLabel("顶边（长方形边宽）");
  bar.setAutoDraw(false);
}



void UIShow() {
  cam.beginHUD();
  lights();
  bar.draw();
  cam.endHUD();
  
  if(mouseX<300&&mouseY<height/2){
    cam.setActive(false);
  }else{
   cam.setActive(true);
  }
    
  
}




