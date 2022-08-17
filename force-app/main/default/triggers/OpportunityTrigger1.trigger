trigger OpportunityTrigger1 on Opportunity (before update, after insert, after update, after delete, after undelete) 
{
	/*if(Trigger.isBefore && Trigger.isUpdate)
    {
        TestClass_Trigger_7.TriggerHandlerMethod(Trigger.OldMap, Trigger.NewMap);
    }
    
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        TestClass_Trigger_7.OpptyMethodToPrePopulateBeforeUpdate(Trigger.New,Trigger.OldMap);
    }
    */
    
    //To Capture all the parent Account IDs
    TriggerStatus__c StatusOfTrigger = TriggerStatus__c.getInstance('ActiveStatus'); 
        if(StatusOfTrigger.isActive__c == true)
        {	
            set<ID> accIds = new set<ID>();
            if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || trigger.isUndelete || Trigger.isDelete))
            {
                for(Opportunity opp : Trigger.New)
                {
                    accIds.add(opp.AccountId);
                }
                if(Trigger.isAfter && Trigger.isDelete)
                {
                    for(Opportunity oppOld : Trigger.Old)
                    {
                        accIds.add(oppOld.AccountId);
                    }    
                }
            } 
            if(!accIds.isEmpty())
            {
                list<account> lstac = [select id,annualrevenue,(select id,amount from Opportunities) from account where ID IN : accIds];
                //Integer Highestamount;
                if(lstac.size()>0)
                {
                    for(account acc : lstac)
                    {
                        acc.AnnualRevenue=0.0;
                        for(Opportunity OP : acc.Opportunities)
                        {
                            // 100000, 20000, 45000, 600
                            if(acc.annualrevenue < OP.amount)
                            {
                                acc.annualrevenue = OP.amount;
                            }
                        }
                    }
                }
                Update lstac;
            }    
        }
    
}