@isTest
public class AccountsTriggerUnitTest 
{
	public static testmethod void accountsTriggerTest()
    {
        Account acc = new account();
        acc.Name = 'TestaccountTrigger';
        acc.Email__c = 'abc@gmail.com';
        insert acc;
        
        List<opportunity> OpportunityList = new list<opportunity>();
        for(integer i=1; i<=10; i++)
        {
         	Opportunity opp = new Opportunity();
            opp.name = 'Test Opportunity' + string.valueOf(i);
            opp.closedate = system.today().addmonths(10);
            opp.StageName = 'Closed Won';
            opp.AccountId = acc.id;
        	
            OpportunityList.add(opp);
        }
        
        insert OpportunityList;
        
        Test.startTest();
        
        Test.stopTest();
        
        try
        {
           account acc1 = [select id,name from account where name='TestaccountTrigger' limit 1]; 
           delete acc1; 
        }
        catch(system.Exception ex)
        {
            
        }
    }
}