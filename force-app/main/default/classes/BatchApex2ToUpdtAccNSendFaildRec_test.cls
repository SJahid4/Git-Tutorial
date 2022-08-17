@isTest
public class BatchApex2ToUpdtAccNSendFaildRec_test 
{
	@isTest
    public static void testMe()
    {
        list<account>lstac = new list<account>();
        for(integer i=1; i<=200; i++)
        {
            account acc = new account();
            acc.Name = 'testdata';
            acc.Email__c='Teset@gmaail.com';
            acc.annualrevenue=99;
            lstac.add(acc);
        }
        if(lstac.size() > 0)
        {
            insert lstac;
        }
        BatchApex2ToUpdtAccNSendFaildRecEmail tests = new BatchApex2ToUpdtAccNSendFaildRecEmail();
        Test.startTest();
        Database.executeBatch(tests);
        Test.stopTest();
     	
        list<account> lstacc =[select id,name,email__c,annualrevenue from account];
        if(!lstacc.isempty())
        {
            for(account accc : lstacc)
            {
        	//	system.assertEquals(3000, lstacc.annualrevenue);        
            }
        }
        
        
        
    }
}