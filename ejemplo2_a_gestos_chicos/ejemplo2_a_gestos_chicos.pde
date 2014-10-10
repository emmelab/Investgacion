Objeto o[];
int cantidad = 200;
float transparencia = 30;
float diametroLimite = 50;
PGraphics lienzo;
PGraphics proceso;
Paleta p;

boolean mediaPantalla = false;

void setup(){
  size(800,450);  
  
  //p = new Paleta( "imagen2.jpg" );
  p = new Paleta( "imagen6.jpg" );
  
  o = new Objeto[ cantidad ];
  for( int i=0 ; i<cantidad ; i++ ){
    o[i] = new Objeto( mediaPantalla , p );
  }

  smooth();
  lienzo = createGraphics( (mediaPantalla ? width/2 : width) , height  );
  lienzo.beginDraw();
  lienzo.background(255);
  lienzo.smooth();
  lienzo.noStroke();
  lienzo.noFill();
  lienzo.endDraw(); 
}
void draw(){
  fill(0);
  rect(width/2,0,width/2,height);
  stroke(255,100);
  noFill();
  for( int i=0 ; i<cantidad-1 ; i++ ){
    o[i].mover();
  }
  
  lienzo.beginDraw();
  for( int i=0 ; i<cantidad-1 ; i++ ){
    for( int j=i+1 ; j<cantidad ; j++ ){
      o[i].vincular( o[j] , lienzo );
    }
  }
  lienzo.endDraw();
  
  for( int i=0 ; i<cantidad-1 ; i++ ){
    o[i].dibujar();
  }
  image( lienzo , 0 , 0 );
}
void mousePressed(){
  save("ejemplo2_a.jpg");
}
