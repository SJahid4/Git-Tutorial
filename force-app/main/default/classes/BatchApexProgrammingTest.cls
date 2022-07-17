@isTest
public class BatchApexProgrammingTest 
{
	
    private static testmethod void Testmethods()
    {
     	list<account> lstaccounts = new list<account>();
        
        for(integer i=1; i<=200; i++)
        {
            Account acc = new Account();
            acc.Name='BatchApexTest';
            acc.Email__c = 'BatchTestEmail@gmail.com';
         // acc.Phone = '8520585200';
         // acc.Fax ='9885208520';
            lstaccounts.add(acc);
        }  
            insert lstaccounts;
            
                //These below 2 methods are used to Bypass the Governor Limits
                 Test.startTest();
                	BatchApexProgramming bprogram = new batchApexProgramming();
                	Database.executeBatch(bprogram);
                 Test.stopTest();
            
        }
}