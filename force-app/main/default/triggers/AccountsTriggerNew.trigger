trigger AccountsTriggerNew on Account (After insert, Before Update) 
{
    if(Trigger.isAfter && Trigger.isInsert)
    {
        list<contact> lstcon = new list<contact>();
        for(account acc : Trigger.New)
        {
            Contact con = new Contact();
            con.lastname=acc.name;
            lstcon.add(con);
        }
        if(lstcon.size()>0)
        {
                Insert lstcon;
        }
    }
    if(Trigger.IsBefore && Trigger.isUpdate)
        {
            for(account a : Trigger.New)
            {
                if(a.Industry == 'Banking')
                {
                    a.Rating ='Hot';
                    a.Active__c ='Yes';
                }
            }
        }
}