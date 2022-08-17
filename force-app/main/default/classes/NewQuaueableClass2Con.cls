public class NewQuaueableClass2Con implements Queueable
{
	public void Execute(QueueableContext qContext)
    {
        list<Contact> conToUpdate = [select id, firstname, lastname from contact];
        if(conToUpdate.size() >0)
        {
            for(contact c : conToUpdate)
            {
                c.firstname ='Queueable Contact';
                c.lastname='Update';
            }
            update conToUpdate;
        }
        
    }
}