public with sharing class lcom_6_retrieveAccountsClass 
{
	@AuraEnabled
    public static list<Account> retrieveAccounts()
    {
        list<account> lstac = [select id,name,rating,industry,Annualrevenue,Owner.Name from account];
        return lstac;
    }
    @AuraEnabled
    public static Account method2(Id accID)
    {
        Account acc = [select id,rating from account where ID =:accId];
        return acc;
    }
}