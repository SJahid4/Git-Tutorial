@isTest
public class AccountsTriggerNew_Test 
{
	@isTest
    public static void method1()
    {
        try{
        	account acc = new account();
            acc.Name = 'nmmbnk';
            acc.Email__c='aa@a.com';
            acc.Industry ='Finance';
            insert acc;    
            
            account acctoUpdate = [select id,industry from account];
            acctoUpdate.Industry='Banking';
            Update acctoUPdate;
            
            }
        Catch(Exception ex){
            system.debug('Message --- '+ex.getMessage());
        }
        
        
        integer accCount = [select count() from account];
        integer conCount = [select count() from contact];
        account ac = [select id,rating,active__c from account];
        
        system.assertEquals(1, accCount);
        system.assertEquals(1, conCount);
        system.debug('Count of Contacts --- '+conCount);
        system.assertEquals('Hot',ac.Rating,'Rating value is not as expected');
        system.assertEquals('Yes',ac.Active__c,'Active status is not updated');
    }
}