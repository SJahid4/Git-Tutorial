@isTest
public class TestClass_OppTrigger_7_Test 
{
    @testsetup static void testdata()
    {
        opportunity opp = new Opportunity();
        opp.Name='test';
        opp.StageName='Closed lost';
        opp.CloseDate = system.today()+15;
        insert opp;    
    }
    @isTest
    public static void testme()
    {
        opportunity opp = [select id,name,stagename,closedate from opportunity];
        opp.StageName='Closed Won';
        update opp;
        
        Opportunity oppNew = [select id,name,stagename,closedate from opportunity];
        system.assertEquals(system.today(), oppNew.CloseDate);
        system.assertEquals('Closed Won',oppNew.StageName);
    }
}