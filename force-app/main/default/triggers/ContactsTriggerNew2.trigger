trigger ContactsTriggerNew2 on Contact (after insert,after update,after undelete,after delete) 
{
    set<ID> accountIds = new set<ID>();
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete))
    {
        
        for(contact c : Trigger.New)
        {
            accountIds.add(c.accountId);
        }
    }else if(Trigger.isAfter && Trigger.isDelete)
       {
           for(contact ccc : Trigger.Old)
           {
               accountIds.add(ccc.accountId);
           }
       }
    if(accountIds.size()>0)
    {
        list<account> lstaccToUpdate = [select id,phone,name,(select id,lastname from contacts) from account where ID IN : accountIds];
        if(!lstacctoupdate.isempty())
        {
            for(account a : lstacctoUpdate)
            {
                if(a.contacts.size()>0)
                {
                    a.Count_of_Contacts__c = a.contacts.size();
                    /*for(contact c : a.contacts)
                    {
                        a.Name = c.LastName;
                    }*/
                }
            }
        }
        update lstacctoupdate;
    }
}