public class NewFutureMethod2 
{
    public NewFutureMethod2()
    {
        mthod1();
        mthod2();
    }
	public static void mthod1()
    {
        list<account> acc = [select id,name from account ];
        for(account a : acc)
        {
            a.name='NEW -- Testing Future Methods';
        }
        update acc;

    }
    @Future
    public static void mthod2()
    {
        list<contact> con = [select id,firstname,lastname from contact];
        for(contact c : con)
        {
            c.firstname ='Testing ';
            c.lastname='Future Methods';
        }
        update con;
      //  NewFutureMethod1.Method3();
    }
}