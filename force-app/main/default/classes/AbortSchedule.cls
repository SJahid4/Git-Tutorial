public class AbortSchedule implements schedulable
{
	public void Execute(schedulableContext sContext)
    {
        for(AsyncApexJob ap: [SELECT Id, ApexClass.Name,createddate, JobType, Status, JobItemsProcessed, MethodName, ParentJobId 
                                     FROM AsyncApexJob 
                                     Where ParentJobId!=Null 
                                     AND JobType IN('BatchApex','BatchApexWorker') 
                                     And ApexClass.Name='NewTestBatchChaining2'
                                     And Status IN('Queued')])
        {
            System.abortJob(ap.ParentJobId);
             
        }

    }
}