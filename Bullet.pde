class Bullet extends Floater
{
	public Bullet(SpaceShip bob)
	{
		myCenterX = bob.getX();
  		myCenterY = bob.getY();
  		myPointDirection = bob.getPointDirection();
  		double dRadians =myPointDirection*(Math.PI/180);
  		myDirectionX = 5 * Math.cos(dRadians) + bob.getDirectionX();
  		myDirectionY = 5 * Math.sin(dRadians) + bob.getDirectionX();
	}
	public void show ()
	{
		fill(255);
		ellipse((float)myCenterX,(float)myCenterY,3,12);
	} 
	public void move ()
	{
		myCenterX += myDirectionX;
		myCenterY += myDirectionY;
		/*if(myCenterX > 600 ||  myCenterX < 0)
		{

		} */
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