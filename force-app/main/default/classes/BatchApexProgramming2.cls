/*
 * @Author : S Jahid
 * @Description : This class is used to test the Asynchronous Apex Programming using StateFul Mechanisam.
 * @Created Date : July 09, 2022
 * @Version : 1.0
 * @Reference : N/A
 * @Modified By :
 * 			Modified By			Modified Date			Reason
 * 			--------------------------------------------------
 * 
 */

Global class BatchApexProgramming2 implements Database.Batchable<sObject>, Database.stateful 
{
    
    Global Decimal AnnualRevenue=0.0;
    
	Global Database.QueryLocator Start(Database.BatchableContext bContext)
    {
        string searchquery = 'select Annualrevenue from account where Annualrevenue != null';
        return database.getQueryLocator(searchquery);
    }
    Global void Execute(Database.BatchableContext bContext, List<sObject> recordsToProcess)
    {
        if(!recordsToProcess.isEmpty())
        {
            for(sObject obj : recordsToProcess)
            {
                Account acc = (Account) obj;
                AnnualRevenue += acc.AnnualRevenue;
                
            }
            system.debug('Total amount --- '+annualrevenue);
        }
    }
    Global void Finish(Database.BatchableContext bContext)
    {
        AsyncApexjob jobdetails = [select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from asyncapexjob where id =: bcontext.getJobId()];
        PractiseUtility2_EmailServices.SendTotalAnnualrevenueToBatchOwner(jobdetails,'TotalAnnualRevenue',AnnualRevenue);
        
    }
}