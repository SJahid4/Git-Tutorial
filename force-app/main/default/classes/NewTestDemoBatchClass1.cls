public with sharing class NewTestDemoBatchClass1  implements Database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext bContext) {
        return Database.getQueryLocator('select id,name from account');
    }

    public void Execute(Database.BatchableContext bContext, List<sObject> accRecordsToProcess){
        if(!accRecordsToProcess.isEmpty())
        {
            for(sObject obj : accRecordsToProcess)

            {
                Account acc = (Account) obj;
                acc.Name ='Calling Future Method from Child Batch';
            }
            Update accRecordsToProcess;
        }
    }

    public void finish(Database.BatchableContext bContext)
    {
        NewTestBatchChaining2 ChainingBatch = new NewTestBatchChaining2();
        Database.executeBatch(ChainingBatch,10);
    }
    
}