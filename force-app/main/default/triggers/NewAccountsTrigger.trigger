Trigger NewAccountsTrigger on Account(After insert, After update)
{
	if(Trigger.isInsert)
	{
        List<contact> CreateCons = new list<contact>();
		for(account acc : Trigger.New)
		{
			for(integer i=1; i<=acc.Number_Of_Contacts_c__c; i++)
			{
				contact con = new contact();
				con.lastname='Test'+i;
                con.AccountId=acc.Id;
				CreateCons.add(con);
			}
            
		}
        if(CreateCons.size()>0)
			{
				Insert CreateCons;
			}
		
	}
	else if(Trigger.isAfter && Trigger.isUpdate)
	{
		for(Account acc : Trigger.Old)
		{
			if(acc.Number_Of_Contacts_c__c < Trigger.OldMap.get(acc.Id).Number_Of_Contacts_c__c)
			{
                	Integer PreviousNumber = Integer.valueOf(Trigger.OldMap.get(acc.Id).Number_Of_Contacts_c__c);
                	Integer CurrentNumber = Integer.valueOf(acc.Number_Of_Contacts_c__c);
					Integer consToDelete = PreviousNumber-CurrentNumber;
                	system.debug('Number of Conts to be Deleted ---- '+constodelete);
					list<contact> lstconstoDelete = [select lastname,accountid from contact where accountID=:acc.Id limit : consToDelete];
						
					if(!lstconstoDelete.isEmpty())
						{
							Delete lstconstoDelete;
						}			
			}
				
		}
	}
}