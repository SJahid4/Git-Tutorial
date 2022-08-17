public with sharing class NewTestBatchChaining2 implements Database.Batchable<sObject> 
{
    public Database.QueryLocator Start(Database.BatchableContext bContext) 
    {
        return Database.getQueryLocator('select id,lastname from contact');
    }
    public void Execute(Database.BatchableContext bContext, list<contact> conToUpdate)
    {
        if(!conToUpdate.isEmpty())
        {
            for(contact con : conToUpdate)
            {
                con.firstname ='Scheduling ';
                con.lastname = 'BatchApex Using CRON';
            }
            update conToUpdate;
        }

    }
    public void Finish(Database.BatchableContext bContext)
    {
		//NewFutureMethod1.Method3();
    }
}