@isTest
public class TestClass_Dml_6_Test 
{
	@testSetup static void testdate()
    {
        list<opportunity> ops = new list<opportunity>();
        for(integer i=1; i<=10; i++)
        {
            user u = [select id,username,alias from user where alias='rreha'];
            Opportunity op = new Opportunity();
            Op.name='Test1'+i;
            Op.StageName = 'Closed Lost';
            Op.CloseDate=system.today();
            Op.OwnerId=u.Id;
            ops.add(op);
        }
        if(!ops.isEmpty())
        {
			insert ops;
        }
    }
    @isTest
    public static void testme1()
    {
        TestClass_Dml_6 test12 = new TestClass_Dml_6();
        test12.callMe();
        
        List<opportunity> lsto = [select id,stagename,closedate from Opportunity];
        if(!lsto.isEmpty())
        {
            for(Opportunity oppp : lsto)
            {
                system.assertEquals('Closed Won', oppp.stagename);
                system.assertEquals(system.today()+15,oppp.closedate);
            }
        }
        
    }
    @isTest
    public static void testMe2()
    {
        TestClass_Dml_6 test12 = new TestClass_Dml_6();
        test12.deleteOpptys();
        
        integer count = [select count() from Opportunity];
        system.assertEquals(0,count);
    }
}