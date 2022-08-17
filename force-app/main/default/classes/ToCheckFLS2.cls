public with sharing class ToCheckFLS2 
{
 	@AuraEnabled
    public static void method1()
    {
        //list<account> lstaccounts = [select id,name,rating,phone,industry,fax,annualrevenue,active__c,type from account WITH SECURITY_ENFORCED];
       /* string query ='select id,name,';
        if(Schema.SObjectType.Account.fields.Rating.isAccessible())
        {
         	query+='phone,rating,industry,fax,annualrevenue from account';   
        }
		list<account>lstaccounts = database.query(query); */
        list<account> lstaccounts = [select id,name,rating,phone,industry,fax,annualrevenue,active__c,type from account where id='0015i00000N9nt0AAB'];
        sObjectAccessDecision securitydecision = security.stripInaccessible(ACCESSTYPE.READABLE, lstaccounts);
        Account ac = (Account) securitydecision.getrecords()[0];
        //system.debug('Total Account Records Count -- '+lstaccounts.size());
            
	    system.debug(ac);
            
        
    }
}