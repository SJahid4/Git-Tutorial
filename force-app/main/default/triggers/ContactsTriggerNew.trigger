trigger ContactsTriggerNew on Contact (after insert, after update, after delete, after undelete) 
{
    /*
     * 
     * 
     * 
     * How can we get the count of the child contact records and want the count to be displayed on the account objects custom fields....
     * On which object we write the Trigger??? is it on ACCOUNT or CONTACT... ANS: CONTACT.
     * 
     */ 
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete))
    {
        set<ID> accIds = new set<ID>();
        for(contact con : Trigger.New) 
        {
            accIds.add(con.accountId);
        }
       list<account> lstacc = [select id,count_of_contacts__c,(select id,accountid from contacts) from account where ID IN : accIds];
        if(!lstacc.isEmpty())
        {
            for(account acc : lstacc)
            {
                acc.Count_of_contacts__c = acc.contacts.size();   
            }
        }
    }
    if(Trigger.isAfter && Trigger.isDelete)
    {
        set<ID> accIds = new set<ID>();
        for(contact con : Trigger.Old) 
        {
            accIds.add(con.accountId);
        }
       list<account> lstacc = [select id,count_of_contacts__c,(select id,accountid from contacts) from account where ID IN : accIds];
        if(!lstacc.isEmpty())
        {
            for(account acc : lstacc)
            {
                acc.Count_of_contacts__c = acc.contacts.size();   
            }
        }
    
    }
    /*
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete))
       {
            list<account> lsta = [select id,count_of_Contacts__c,(select id,accountid from contacts) from account];
           if(lsta.size() > 0)
           {
               for(account a : lsta)
               {
                   a.count_of_Contacts__c = a.contacts.size();
               }
           }
       }
    
    */
    
    /*
     * 
     * We have a Trigger on Contact Object, what my requirement is.....Whenever we After insert,update,delete,undelete CHILD contact records, 
     * i want my Custom field which I have in Account/parent object like ContactName should be updated with value of all of its associated Child
     * contacts first name,,,,how can we implement this functionality??
     * *
     */
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete))
    {
        set<ID> accc = new set<id>();
        for(contact con : Trigger.New)
        {
            accc.add(con.accountid);
        }
        if(!accc.isempty())
        {
            list<account> lst = [select id,name,description,(select id,lastname from contacts) from account where id IN : accc];
            if(!lst.isEmpty())
            {
                for(account a : lst)
                {	
                    if(!a.contacts.isempty())
                    {
                        list<string> childcons = new list<string>();
                        for(contact c : a.contacts)
                        {
                             childcons.add(c.lastname);
                        }
                        if(!childcons.isempty())
                        {   
                            a.name = a.name+childcons;
                        }
                    }
                }
            }
            update lst;
        }
    }
 
}