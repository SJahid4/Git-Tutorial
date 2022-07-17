public class AccountsTriggerHandler 
{
    public static void beforeInsertHandler(list<account> newRecords)
    {
        if(!newRecords.isempty())
        {
            system.debug('uh-ho Its to Check whether Im Being Called or not Before Insert');
            for(Account accRecord : newRecords)
            {
                if(accRecord.ShippingCountry == null)
                    accRecord.ShippingCountry = accRecord.BillingCountry;
                if(accRecord.ShippingState == null)
                    accRecord.ShippingState = accRecord.BillingState;
                if(accRecord.ShippingCity == null)
                    accRecord.ShippingCity = accRecord.BillingCity;
                if(accRecord.ShippingStreet == null)
                    accRecord.ShippingStreet = accRecord.BillingStreet;
                if(accRecord.ShippingPostalCode == null)
                    accRecord.ShippingPostalCode = accRecord.BillingPostalCode;
                    //SCENARIO -- 2 
                If(accRecord.annualrevenue < 1000)
                    accRecord.addError('AnnualRevenue Cant be less than 1000');   
            }
        }
    }
    
    public static void afterInsertCreateContact(list<account> recordsToCreateContact)
    {
        List<Contact> lstCons = new List<Contact>();
            for(Account accRec : recordsToCreateContact)
            {
                 Contact con = new Contact();
                 con.lastname = accRec.Name;  
                 con.accountid = accRec.Id; 
                 con.email = accRec.Email__c;
                 con.Phone = '9797979797';
                 lstCons.add(con);
            }
            if(!lstCons.isempty())
            {
                INSERT lstCons; 
            }

    }
    
    public static void toCheckAccNameGotChangedOrNOT(List<account> accountsToCheckName, Map<id,account> OldAccInMap)
    {
        if(!accountstoCheckName.isEmpty())
        {
            for(account accRec : accountstoCheckName)
        {
            if(accRec.Name != OldAccInMap.Get(accRec.Id).Name)
            {
                accRec.addError('You are Not Authorized to Modify Name');
            }
        }

        }
     }
    
    /*
    public static void AfterUpdateAccountUpdateContact()
     {
         
         for(Account accRecNew : Trigger.New)
        {
            if(accRecNew.BillingStreet != Trigger.oldMap.get(accRecNew.Id).BillingStreet || accRecNew.BillingCity != Trigger.OldMap.get(accRecNew.Id).BillingCity)
            {
                list<account> lstacc = [select id,BillingStreet, BillingCity,BillingState,BillingCountry,BillingPostalCode, (select id,Mailingstreet,MailingCity,MailingCountry,MailingState,MailingPostalCode from contacts) from account where id IN : Trigger.NewMap.keySet()];
				list<contact> contactsToUpdate = new List<contact>();
                IF(lstacc.size() >0)
                {
                    for(account acc : lstacc)
                    {
                        list<contact> childcons = acc.contacts;
                        for(contact con : childcons)
                        {
                            con.MailingCity = acc.BillingCity;
                            con.MailingStreet = acc.BillingStreet;
                            con.MailingCountry = acc.BillingCountry;
                            con.MailingPostalCode = acc.BillingPostalCode;
                            con.MailingState = acc.BillingState;
                            contactsToUpdate.add(con);	                            
                        }
                    }
                    if(contactsToUpdate.size() >0)
                    {
                        UPDATE contactsToUpdate; 
                    }
                }
            }
        }
     }
*/
    
/*
 * 
 * 
 * 
 *     public void handleBeforeDelete(List<Account> oldAccountsList, Map<Id,Account> oldAccountsMap)
    {
        
        // set<Id> accountsId = oldaccountsmap.keyset();
        List<Opportunity> OpportunityList = [select id,Name,stagename,closedate,amount,type,leadsource,accountId from Opportunity
                                            		where accountId IN : oldAccountsMap.keyset() AND StageName ='Closed Won'];
        Map<Id, Opportunity> OpportunitiesMap = new Map<id,opportunity>();
        
        if(!OpportunityList.isempty())
        {
            for(Opportunity opp : OpportunityList)
            {
                if(!OpportunitiesMap.ContainsKey(opp.accountId))
                {
                    OpportunitiesMap.put(Opp.AccountId, opp);
                }
            }
            for(account acc : OldAccountsList)
            {
                if(OpportunitiesMap.ContainsKey(acc.id))
                {
                    acc.addError('you can not Delete the ACCOUNT which have Closed Won Opportunities!!! Please Contact Your Admin');
                }
            }
            
        }

    }
*/
}