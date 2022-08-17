public class NewScheduling implements Schedulable
{
	public void Execute(SchedulableContext sContext)
    {
        NewTestBatchChaining2 contoUpdate = new NewTestBatchChaining2();
        Database.executeBatch(contoUpdate,25);
        
        //NewQueueable1Acc cc = new NewQueueable1Acc();
        system.enqueueJob(new NewQueueable1Acc());
        system.enqueueJob(new NewQuaueableClass2Con());
    }
}