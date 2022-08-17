trigger AccountsTriggertoGetCountofCon on Contact(After insert, After Update, After Delete, After Undelete) 
{
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isDelete || Trigger.isUndelete || Trigger.isUpdate))
    {
        List<Contact> ConRecord = Trigger.NewMap.values();
        set<ID> accIds = new set<ID>();
        for(Contact con : ConRecord)
        {
            accIds.add(con.AccountId);
        }
        List<account> lstacc = [select id,Count_Of_Contacts__c,(select id from contacts) from account where Id IN : accIds];
        if(!lstacc.isEmpty())
        {
            for(account acc : lstacc)
            {
                if(!acc.contacts.isEmpty())
                {
                    acc.Count_Of_Contacts__c = acc.contacts.size();
                }
            }
        }
    }
}