Global class NewBatchToRunParellelWithQueue implements Database.Batchable<sOBject>{
    Global Database.QueryLocator Start(Database.BatchableContext bContext){
        return Database.getQueryLocator('select id,name from account');
    }
    Global Void Execute(Database.BatchableContext bContext,list<account> recordsToProcess){
        if(!recordsToProcess.isEmpty())
        {
            for(account a : recordstoprocess)
            {
                a.name='ToVerifyParallelJobExecutionFromQueue';
            }
            update recordsToProcess;
        }
                System.enqueueJob(new NewQueueForParallelProcessing());

    }
    Global Void Finish(Database.BatchableContext bContext){
        
    }
}