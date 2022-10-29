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
