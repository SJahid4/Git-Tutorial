trigger TaskTrigger on Task(After insert, After Update) 
{
	set<ID> accIds = new set<ID>();
	if(Trigger.isAfter && Trigger.isInsert)
	{
		for(Task tsk : Trigger.New)
		{
			accIds.add(tsk.WhatId);
		}
	}
	else if(Trigger.isAfter && Trigger.isUpdate)
	{
		for(Task ts : Trigger.New)
		{
			if(ts.Description != Trigger.OldMap.get(ts.id).Description)
			{
				accIds.add(ts.WhatId);
			}
			
		}
	}
		if(accIds.size()>0)
		{
			list<account> acctoUpdate = [select id, description,(select id,description,WhatId from tasks) from account where ID IN : accIds];
			
			if(!acctoUpdate.isEmpty())
			{
				for(account acUpdate : acctoUpdate)
				{
                    for(task t : acUpdate.Tasks)
                    {
                    	acUpdate.description = t.description;    
                    }
					
				}
			}
			Update acctoUpdate;
		}
	
}