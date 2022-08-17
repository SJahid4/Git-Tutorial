public class e implements Queueable
{
	public void Execute(QueueableContext qContext)
    {
        List<account> acctoupdate= [select id,name from account];
        if(acctoupdate.size()>0)
        {
            for(account ac : acctoupdate)
            {
                ac.name='Being called from Batch';
            }
            update acctoupdate;
        }
        
    //    String jobId = system.enqueueJob(new NewQuaueableClass2Con());
	//	system.debug('@@JOB ID--' + jobid);
    }
}