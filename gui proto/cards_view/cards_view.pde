PGraphics pg;

String dates[] = {"Today","14/04/2021","15/04/2021","16/04/2021","17/04/2021","18/04/2021"};

void setup() {

  size(960, 544);
  pg = createGraphics(400, 200);
}

void drawBottomBar()
{

  int blockSize = 160;
  int acc = 0;
  
  
  
  for(int i =0;i < dates.length;i++)
  {
    float centerx = (acc+(blockSize/2));
    float centery = ((height - 96)+(blockSize/2));
    
      
      
      
      fill(160);
      rect(acc,(height - 96),blockSize,96);
      
      fill(255);
      text(dates[i],centerx,centery);
      
      acc = acc + blockSize;
      
  }

}

void drawCards()
{
  int blockSize = 120;
  int acc = 0;
  
  
  
  for(int i =0;i < dates.length;i++)
  while(acc < 960)
  {
    //float centerx = (acc+(blockSize/2));
    //float centery = (120+(blockSize/2));
    
      
      
      
      fill(80);
      rect(acc,120,blockSize,(height - 96)-120);
      
      //fill(255);
      //text(dates[i],centerx,centery);
      
      acc = acc + blockSize;
      
  }

}


void draw() {
  fill(0, 100, 255);
  rect(0, 0, width, height);
  
  //status bar etc
  fill(60);
  rect(0,0,960,60);
  
    //status bar etc
  fill(60);
  rect(0,60,960,60);
  

  // fill bottom bar with rectangles evenly 
  drawBottomBar();
  drawCards();  
  
  
  
  
  
  //noStroke();
   //ellipse(mouseX, mouseY, 60, 60);
  
  //pg.beginDraw();
  //pg.background(51);
  //pg.noFill();
  //pg.stroke(255);
  //pg.ellipse(mouseX-120, mouseY-60, 60, 60);
  //pg.endDraw();
  
  // Draw the offscreen buffer to the screen with image() 
  //image(pg, 120, 60); 
}
