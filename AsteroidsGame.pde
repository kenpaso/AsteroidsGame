//your variable declarations here
SpaceShip rock;
Star[] nightSky = new Star[500];

ArrayList <Bullet> gun = new ArrayList <Bullet>();
ArrayList <Asteroid> theList = new ArrayList <Asteroid>();
public void setup() 
{
  //your code here
  size(600,600);
  background(0);
  rock = new SpaceShip();

  for(int i = 0; i < nightSky.length; i++)
  {
    nightSky [i] = new Star();
  }
  for(int i = 0; i < 500; i++)
  {
    theList.add(new Asteroid());
  }
}

public void draw() 
{
  //your code here
  background(0);
  for(int i = 0; i < nightSky.length; i++)
  {
    nightSky[i].show();
  }


  for(int i = 0; i< theList.size(); i ++)
  {
    theList.get(i).show();
    theList.get(i).move();
  }

  for(int i = 0; i< gun.size(); i ++)
  {
    gun.get(i).show();
    gun.get(i).move();
  }
for(int k = 0; k < gun.size(); k++)
{
  for(int i = 0; i< theList.size(); i ++)
    //if(dist(rock.getX(),rock.getY(), theList.get(i).getX(),theList.get(i).getY()) < 20)
    //{
      //theList.remove(i);
    //}
    if(dist(gun.get(k).getX(),gun.get(k).getY(), theList.get(i).getX(),theList.get(i).getY()) < 20)
    {
      theList.remove(i);
    }
}
  rock.show();
  rock.move();


}

class Star
{
  private int myX, myY, myColor;
  public Star()
  {
    myColor = color(255);
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
  }
  public void show()
  {
    stroke(myColor);
    ellipse(myX, myY, 1, 1);
  }
}
public void keyPressed()
{

  if(key == ' ')
  { 
    gun.add(new Bullet(rock));

  }   
  if(keyCode == UP)
  {
    rock.accelerate(1);
  }
  else if(keyCode == RIGHT)
  { 
    rock.rotate(7);
  }
  else if(keyCode == LEFT)
  { 
    rock.rotate(-7);
  }
  else if(keyCode == DOWN)
  { 
    rock.accelerate(-1.5);
  }
   else if(key == 'b')
  { 
    rock.setDirectionX(0);
   rock.setDirectionY(0);
  }   
   else if(key == 'h')
  { 
    rock.hyperspace();
  }      
  else if(key == 'x')
  { 
    rock.accelerate(500);

  }    

}

class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
      corners = 8;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -10;
      yCorners[0] = 0;
      xCorners[1] = -4;
      yCorners[1] = -5;
      xCorners[2] = 0;
      yCorners[2] = -10;
      xCorners[3] = 9;
      yCorners[3] = -9;
      xCorners[4] = 10;
      yCorners[4] = 0;
      xCorners[5] = 8;
      yCorners[5] = 7;
      xCorners[6] = -1;
      yCorners[6] = 10;
      xCorners[7] = -8;
      yCorners[7] = 7;

      myCenterX = Math.random()*600;
      myCenterY = Math.random()*600;
      myDirectionX = (Math.random()*3)-1.5;
      myDirectionY = (Math.random()*3)-1.5;
      myPointDirection = Math.random()*360;
      myColor = color(192,192,192);
      rotSpeed = ((int)(Math.random()*5)-3);
 
      }
      public void move()
      {
       rotate((int)(rotSpeed));
       super.move();
      }
    
  
    public void setX(int x){myCenterX = x;}
    public int  getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int  getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return (double)myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return (double)myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return (double)myPointDirection;} 
}  



class SpaceShip extends Floater  
{   
    //your code here

    public SpaceShip()
    {
      corners = 4;
      int[] xS = {-8,16,-8,-2};
      int[] yS = {-8,0,8,0}; 
      xCorners = xS;
      yCorners = yS;

      myCenterX = 300;
      myCenterY = 300;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 270;
      myColor = color(255,0,0);

    }

    public void setX(int x){myCenterX = x;}
    public int  getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int  getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return (double)myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return (double)myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return (double)myPointDirection;} 

    public void hyperspace()
{
  setDirectionX(0);
  setDirectionY(0);
  setX((int)(Math.random()*600)+1);
  setY((int)(Math.random()*600)+1);
  setPointDirection((int)(Math.random()*360));
}
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

