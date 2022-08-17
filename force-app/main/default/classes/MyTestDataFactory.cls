@isTest
public class MyTestDataFactory 
{
	public static void testdata()
    {
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
    }
    public static void Opportunitydata()
    {
        List<Opportunity> lstOpptys = new list<Opportunity>();
        for(integer i=1; i<=5; i++)
        {
            Opportunity Opp = new Opportunity();
            Opp.Name='Opp1';
            Opp.StageName='Prospecting';
            Opp.CloseDate=Date.newInstance(2022, 11, 25);
            Opp.amount=5000+i;
            lstOpptys.add(Opp);
        }
        Insert lstOpptys;
    }
}