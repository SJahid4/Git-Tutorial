Global with sharing class BatchApexNew1 implements Database.Batchable<sObject> 
{
    Global Database.QueryLocator Start(Database.BatchableContext bContext) 
    {
        String searchQuery = 'select id,username,isActive,email,profile.name from user where LastLoginDate < LAST_N_DAYS : 30';
        return Database.getQueryLocator(searchQuery);
    }
    Global Void Execute(Database.BatchableContext bContext, list<sObject> recordsToProcess)
    {
        List<user> listtoUPdate = new List<user>();
        if(!recordsToProcess.isempty())
        {
            FOR(SObject obj : recordsToProcess)
            {
                User uu = (User) obj;
                uu.isActive = false;
                listtoUPdate.add(uu);
            }
            if(!listtoupdate.isempty())
            {
                Database.saveResult [] saveResult = Database.update(listtoUPdate,false);
                if(!saveResult.isempty())
                {
                    for(Database.saveResult reslt : saveResult)
                    {
                        if(reslt.isSuccess())
                        {
                            System.debug('Record has been processed with ID --- ' + reslt.getId());
                        }
                        else 
                        {
                            Database.Error [] err = reslt.getErrors();
                            if(!err.isempty())
                            {
                                for(Database.Error er : err)
                                {
                                    system.debug('Error message --- '+ er.getMessage());
                                    system.debug('Status COde---- '+er.getStatuscode());
                                    system.debug('Field --- '+ er.getFields());
                                }
                            }        
                        }
                    }
                }
            }
        }
    }
    Global void Finish(Database.BatchableContext bContext)
    {

        AsyncApexJob jobId = [select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from asyncapexjob where id=:bContext.getJobId()];
         
    }
}
