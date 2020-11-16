package in.co.singleton;

public  class A {
	
	private static A a=null;
	
	private A()
	{
		
	}
	
	public static A getInstance()
	{
		if(a==null)
		{
			a=new A();
		}
		return a;
	}

}
