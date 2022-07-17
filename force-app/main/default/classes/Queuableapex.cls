public class Queuableapex implements Queueable 
{
    public void execute(QueueableContext context) 
    {
        Account a = new Account(Name='Acme',Phone='(415) 555-1212', email__c='rehaan4.rehaan6@gmail.com');
        insert a;        
        
        if(a !=null)
        {
            //Chaining the Queueable Apex
         id contactsjobbid = system.enqueueJob(new QueueableContacts(a));   
        }
    }
}