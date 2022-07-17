/*
 * @Author : S Jahid
 * @Description : This class is used to test the Asynchronous Apex Programming.
 * @Created Date : July 09, 2022
 * @Version : 1.0
 * @Reference : N/A
 * @Modified By :
 * 			Modified By			Modified Date			Reason
 * 			--------------------------------------------------
 * 
 */

Global class BatchApexProgramming implements Database.Batchable<sObject> 
{
	Global Database.QueryLocator Start(Database.BatchableContext bContext)
    {
        string searchquery = 'select name,phone,fax,email__c from account';
        return database.getQueryLocator(searchquery);
    }
    Global void Execute(Database.BatchableContext bContext, List<sObject> recordsToProcess)
    {
        list<account> acctoupdate = new list<account>();
        if(!recordsToProcess.isEmpty())
        {
            for(sObject obj : recordsToProcess)
            {
                Account acc = (Account) obj;
                acc.Name = 'Batchh';
                acc.Phone = '7386692622';
                acc.Fax = '9059995863';
                acc.Email__c ='batchTest@gmail.com';
                acctoupdate.add(acc);
            }
            if(!acctoupdate.isEmpty())
            {
                system.debug('Size -- '+acctoupdate.size());
                update acctoupdate;
            }
        }
    }
    Global void Finish(Database.BatchableContext bContext)
    {
        AsyncApexjob jobdetails = [select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from asyncapexjob where id =: bcontext.getJobId()];
        PractiseUtility2_EmailServices.SentemailtoBatch(jobdetails,'Accounts Update Batch');
        
    }
}