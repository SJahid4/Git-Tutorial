public with sharing class ToCheckFLS 
{
 	@AuraEnabled
    public static list<account> method1()
    {
        list<account> lstaccounts = [select id,name,rating,phone,industry,fax,annualrevenue,active__c,type from account];
        return lstaccounts;
        /*if(lstaccounts.size()>0)
        {
            for(account acc : lstaccounts)
            {
                system.debug(acc);
            }
        }*/
    }
}