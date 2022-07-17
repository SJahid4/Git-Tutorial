public class TestClass_DmlOps_4 
{
	public account acc;
    
    public void method1()
    {
        acc = new account();
        acc.name='Testing1';
        acc.Email__c = 'Testing1@gmail.com';
        insert acc;
    }
    public void method2()
    {
        list<account> lstaccounts = [select rating from account where createddate=TODAY];
        if(!lstaccounts.isEmpty())
        {
            for(account a : lstaccounts)
            {
                a.rating='Hot';
            }
            update lstaccounts;
        }
    }
    public void deletedata()
    {
     	list<account> lstaccounts = [select rating from account where createddate=TODAY];
        if(!lstaccounts.isempty())
        {
            delete lstaccounts;
        }
    }
}