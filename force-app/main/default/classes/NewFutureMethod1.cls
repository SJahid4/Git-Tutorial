public class NewFutureMethod1 
{
    /*public NewFutureMethod1()
    {
        Method1();
        Method2();
        Method3();
        Method4();
    }*/
	public static void Method1()
    {
        system.debug('Waking up ');
    }
    public static void Method2()
    {
        system.debug('Daily activities----Getting ready');
    }
    @Future
    public static void Method3()
    {
        system.debug('Car wash/Car Service');
    	//NewFutureMethod2.mthod2();
    	system.enqueueJob(new NewQueueable1Acc());
    }
    public static void Method4()
    {
        system.debug('Date with GF');
        
    }
}