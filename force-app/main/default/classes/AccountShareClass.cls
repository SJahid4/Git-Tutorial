public with sharing class AccountShareClass 
{
	public static void method1()
    {
        list<account> lstaccounts = [select id,name,email__c,industry from account];
        user u = [select id,username,firstname,lastname,email,profile.name,isactive from user where isactive=true and username='s.jahid4444@gmail.com' limit 1];
        if(lstaccounts.size()>0)
        {
            list<AccountShare> accshr = new list<accountshare>();
            system.debug('size of accounts - '+lstaccounts.size());
            for(account a : lstaccounts)
            {
            	AccountShare accshare = new accountshare();
            	accshare.AccountId = a.id;
                accshare.AccountAccessLevel ='EDIT';
                accshare.OpportunityAccessLevel='EDIT';
              //  accshare.RowCause=Schema.Accountshare.RowCause.Manual('Error');
                accshare.UserOrGroupId=u.id;
                accshr.add(accshare);
            }
            if(accshr.size()>0)
            {
                insert accshr;
            }
        }
    }
}