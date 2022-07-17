public class QueueableContacts implements Queueable
{
    public account accrecord;
    
    public QueueableContacts(account acc)
    {
        accrecord = acc;
    }
	public void Execute(QueueableContext qcontext)
    {
        if(accrecord != null)
            
        {
            contact con = new contact();
            con.firstname = 'Chaining Queueable Jobs';
            con.LastName = 'Queueable Apex';
            con.AccountId = accrecord.id;
            insert con;
        }
    }
}