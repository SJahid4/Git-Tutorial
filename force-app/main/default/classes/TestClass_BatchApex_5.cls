Global class TestClass_BatchApex_5 implements Database.Batchable<sObject>
{
    Global Database.QueryLocator Start(Database.BatchableContext bContext)
    {
        string searchQuery = 'select rating,ownership from account';
        return Database.getQueryLocator(searchQuery);
    }
    
    Global Void Execute(Database.BatchableContext bContext, List<sObject> recordsToProcess)
    {
		if(!recordsToProcess.isEmpty())
        {    
        	for(sObject sobj : recordsToProcess)
            	{
                	Account acc = (Account) sobj;
                    acc.Rating = 'warm';
                    acc.Ownership ='private';
            	}
             update recordsToProcess;
        }
    }
    Global void Finish(Database.BatchableContext bContext)
    {
        
    }
}