trigger OpportunityTrigger1 on Opportunity (before update) 
{
	if(Trigger.isBefore && Trigger.isUpdate)
    {
        TestClass_Trigger_7.TriggerHandlerMethod(Trigger.OldMap, Trigger.NewMap);
    }
}