public class NewQueueable1Acc implements Queueable
{
	public void Execute(QueueableContext qContext)
    {
        Account acc = new Account(name='Queueable Account',email__c='QueueableAccount@gmail.com');
        insert acc;
        
        if(acc.id != Null)
        {
            system.enqueueJob(new NewQueueable2Con(acc));
        }
    }
}