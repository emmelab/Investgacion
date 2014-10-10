class Objeto{
  float x,y;
  float d;
  float direccion;
  float velocidad;
  boolean mediaPantalla;
  float limite;
  color c;
  //---------------------------
  Objeto( boolean mediaPantalla_ , Paleta p ){
    mediaPantalla = mediaPantalla_;
    limite = ( mediaPantalla ? width/2 : width );
    x = random(limite);
    y = random(height);
    direccion = random(TWO_PI);
    velocidad = random(0.2,2);
    d = random(5,diametroLimite);
    //c = color( random(255) , transparencia );
    c = p.devolverPixel( transparencia );
  }
  void mover(){
    x += velocidad*cos(direccion);
    y += velocidad*sin(direccion);
    x = ( x>limite ? x-limite : x );
    y = ( y>height ? y-height : y );
    x = ( x<0 ? x+limite : x );
    y = ( y<0 ? y+height : y );
  }
  
  void vincular( Objeto otro , PGraphics lienzo ){
    float distMin = d/2+otro.d/2;
    float distancia = dist(x,y,otro.x,otro.y);
    float interseccion = distMin - distancia;
    lienzo.stroke( c );
    if( interseccion>0 ){
      /*
      float xx = (x+otro.x)/2;
      float yy = (y+otro.y)/2;
      lienzo.ellipse( xx , yy , interseccion , interseccion );
      */
      lienzo.line(x,y,otro.x,otro.y);
    }
  }
  
  void dibujar(){
    if( mediaPantalla ){
      fill(c);
      ellipse(x+limite,y,d,d);
    }    
  }
  
}

