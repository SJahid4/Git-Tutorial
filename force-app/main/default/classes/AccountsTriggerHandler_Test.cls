@isTest
public class AccountsTriggerHandler_Test {
    @isTest
    public static void beforeInsertTest()
    {
        MyTestDataFactory.testdata();
        Account acc = [select billingstate,billingcity,billingcountry,billingpostalcode,billingstreet,shippingcountry,shippingstate,shippingcity,
                      	shippingpostalcode,shippingstreet,annualrevenue from account];
        system.assertEquals(acc.ShippingCity,acc.BillingCity);
        system.assertEquals(acc.ShippingCountry,acc.BillingCountry);
        system.assertEquals(acc.ShippingState,acc.BillingState);
        system.assertEquals(acc.ShippingPostalCode,acc.BillingPostalCode);
        system.assertEquals(acc.ShippingStreet, acc.BillingStreet);
        system.assertEquals(1001000, acc.AnnualRevenue);
    }
    
    @isTest
    public static void afterInesrtCreatContactTest()
    {
     	MyTestDataFactory.testdata();
        Account acc = [select id,name from account];
        Contact con = [select id,lastname,accountid from contact];
        Integer countofContacts = [select count() from contact];
        system.debug('Count of COntacts are --- '+ countofContacts);
        system.assertEquals(1, countofContacts);
        system.assertEquals(acc.name,con.lastName);
        system.assertEquals(acc.Id,con.AccountId);
    }
    
    @isTest public static void beforeupdateCheckAccName()
    {
        MyTestDataFactory.testdata();
        
        account acc = [ select name from account];
        account acc1 = [ select name from account];
        acc1.Name = acc.Name;
        acc1.Phone='6304038978';
        if(acc.Name==acc1.Name) 
        {
            update acc1;
        }
        
       system.assertEquals(acc.Name,acc1.Name);
    }
	
    @isTest public static void ToCheckScenario5()
    {
         account acc = new account();
        acc.Name = 'TestData';
        acc.Email__c='Testdata@gmail.com';
        acc.Rating='Hot';
        acc.Ownership='public';
        acc.active__c ='No';
        acc.BillingCountry = 'India';
        acc.BillingCity = 'Hyderabad';
        acc.BillingState='Telangana';
        acc.BillingStreet='madhuranagar';
        acc.BillingPostalCode='500038';
        acc.AnnualRevenue=1001000;
        insert acc;
        
        if(acc.Id != null)
        {
            contact con = new contact();
            con.LastName = 'Child of Test';
            con.AccountId = acc.Id;
            insert con;
        }
        
        Account accUpdate = [select id,name,billingstate,billingcity from account];
        accUpdate.BillingStreet = 'JubileeHills';
        accUpdate.BillingCity = 'Bangalore';
        update accUpdate;
        
        if(acc.BillingCity != accUpdate.BillingCity && acc.BillingStreet != accupdate.BillingStreet)
        {
                list<contact> conNew = [select id,MailingCity, MailingStreet from contact where accountid =: accUpdate.Id];
            	if(!conNew.isempty())
                {	
                    for(contact connn : conNew)
                    {
	                    connn.MailingCity = accUpdate.BillingCity;
	                    connn.MailingStreet = accUpdate.BillingStreet;
    	                update connn; 
                        
                        system.assertEquals(accUpdate.BillingStreet,connn.MailingStreet);
		                system.assertEquals(accUpdate.BillingCity, connn.MailingCity);       

	                 }
                }
            
        }
       
    }
    @isTest
    public static void TestingScenario6()
    {
        
        
        try{
            MyTestDataFactory.testdata();
            Account acc = [select name,active__c from account];
            delete acc;    
        }
        catch(exception ex)
        {
            Boolean expectedExceptionThrown = ex.getMessage().contains('You are Not AUTHORIZED to Delete Active Accounts') ? true : false;
            System.assertEquals(expectedExceptionThrown, true);
        /*    OR
            System.assertEquals(expectedExceptionThrown, false);
        */  //string message = ex.getMessage();
            //system.assertEquals(message.contains('You are Not AUTHORIZED to Delete Active Accounts'), 'message=' + message);
        }
        integer count = [select count() from account];
        system.assertEquals(1,count);

        
        //To Tese SCENARION - 7 we are using the same method and adding Assert statements here
        //MyTestDataFactory.testdata();
        Account accnew = new account();
        accnew.Name = 'new';
        accnew.Email__c='new@gmail.com';
        insert accnew;
        Account acc1 = [select name,active__c from account where name=:accNew.Name limit 1];
        delete acc1;
        list<Account> acctoundelete = [select id,name,isDeleted from account where name=:acc1.Name AND isDeleted=True Limit 1 ALL ROWS];
        system.debug('undeleting record count is ---- '+acctoundelete.size());
        if(!acctoundelete.isempty())
        {
            UNDELETE acctoundelete;
        }
        integer countNew= [select count() from account];
       // system.assertEquals(1,countNew);
    }
}