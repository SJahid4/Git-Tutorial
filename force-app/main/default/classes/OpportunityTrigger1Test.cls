@isTest
public class OpportunityTrigger1Test {
	@isTest
    public static void method1(){
        account acc = new account();
        acc.Name = 'TestData';
        acc.Email__c='Testdata@gmail.com';
        acc.Rating='Hot';
        acc.Ownership='public';
        acc.active__c ='Yes';
        acc.BillingCountry = 'India';
        acc.BillingCity = 'Hyderabad';
        acc.BillingState='Telangana';
        acc.BillingStreet='madhuranagar';
        acc.BillingPostalCode='500038';
        acc.AnnualRevenue=1001000;
        insert acc;
        if(acc.Id!=null)
        {
          	List<Opportunity> lstOpptys = new list<Opportunity>();
            for(integer i=1; i<=5; i++)
            {
                Opportunity Opp = new Opportunity();
                Opp.Name='Opp1';
                Opp.StageName='Prospecting';
                Opp.CloseDate=Date.newInstance(2022, 11, 25);
                Opp.amount=5000+i;
                Opp.AccountId=acc.Id;
                lstOpptys.add(Opp);
            }
            Insert lstOpptys;
  
        }
        Account accToDML = [select id,annualrevenue from account];
        Opportunity OppToUpdate = [select id,amount from Opportunity where accountId =:accToDML.Id and amount = 5001 limit 1];
        OppToUpdate.Amount=5010;
        Update OppToUpdate;
        
        Opportunity OppToDelete = [select id,amount from Opportunity where accountId =:accToDML.Id and amount = 5010 LIMIT 1];
        System.debug('Delete data '+OppToDelete);
        Delete OppToDelete;
        
        Opportunity OppToUnDelete = [select id,amount,isDeleted from Opportunity where accountId =:accToDML.Id and amount = 5010 and ISDELETED=true LIMIT 1 ALL ROWS];
        System.debug('Undeleted data '+OppToUnDelete);
        Undelete OppToUnDelete;
        
        Account acc1 = [select id,annualrevenue from account];
        list<account> lstacc = [select id,annualrevenue,(select id,amount from Opportunities) from account where id =:acc1.Id];
        Decimal Highestamount=0.0;
        if(!lstacc.isEmpty())
        {
            for(account ac : lstacc)
            {		
                for(Opportunity Opp : ac.Opportunities)
                {	
                    if(Highestamount <Opp.Amount)
                    {
						Highestamount = Opp.Amount;                        
                    }
                }
            }
        }
        System.debug('Highest amount of Oppty is -- '+Highestamount);
        System.assertEquals(Highestamount, acc1.AnnualRevenue,'AnnuaualRevenu value is not Update as Expected');
        
       /* System.assertEquals(Opp.Amount,acc.AnnualRevenue,'AnnualRevenue has been not Modified');
        
     // Account accToUpdate = [select id,annualrevenue from account];
        Opportunity OppToUpdate = [select id,amount from opportunity];
        
        OppToUpdate.Amount= 100000;
        update Opptoupdate;
        */
        
    }
}