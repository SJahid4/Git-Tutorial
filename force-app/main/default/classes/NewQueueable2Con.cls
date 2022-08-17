public class NewQueueable2Con implements Queueable
{
    public Account accRecord;
    public NewQueueable2Con(Account acc)
    {
        accRecord = acc;
    }
    
	public void Execute(QueueableContext qContext)
    {
        Contact con = new Contact(firstname=accRecord.Name, lastname=accRecord.Name, accountId=accRecord.Id);
    	insert con;
    }
}