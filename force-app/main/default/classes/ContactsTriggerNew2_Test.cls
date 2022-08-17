@isTest
public class ContactsTriggerNew2_Test 
{
	@isTest
    public static void method()
    {
        MyTestDataFactory.Testdata();
        
        try{
        Contact con = new contact();
        con.LastName='Now the value has Modified';
        insert con;
        }
        catch(Exception ex){
            system.debug('Exceptions --- '+ex.getMessage());
        }        
        contact con1 = [select lastname from contact limit 1];
        account ac = [select name from account];
        system.assertEquals(con1.LastName,ac.Name);
    }
}