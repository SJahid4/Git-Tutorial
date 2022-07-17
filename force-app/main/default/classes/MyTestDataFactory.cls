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
}