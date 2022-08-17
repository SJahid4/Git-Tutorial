public class NewQueueForParallelProcessing implements Queueable
{
	public void Execute(QueueableContext qContext)
    {
        list<contact> lst = [select firstname,lastname from contact];
        for(contact c : lst)
        {
            c.firstname='ToVerify -- ';
            c.lastname='ParalleProcessing';
        }
        Update lst;
    }
}