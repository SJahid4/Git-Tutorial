Global with sharing class BatchApex2ToUpdtAccNSendFaildRecEmail implements Database.Batchable<sObject>, Database.stateful, Schedulable 
{
    Global BatchApex2ToUpdtAccNSendFaildRecEmail()
    {}

        //To Store Both SUCCESS and FAILED Records into the Collection we need to Define 2 separate Set Collections.
    Set<ID> SuccessRecIDS = new Set<ID>();
    Set<ID> FailedRecIDS = new Set<ID>();
    
    Global Database.QueryLocator Start(Database.BatchableContext bContext) {
        String searchQuery = 'select id,name,industry,description,(select id,lastname,accountid from contacts) from account';
        return Database.getQueryLocator(searchQuery);
    }
    Global void Execute(Database.BatchableContext bContext, List<account> recordsToProcess)
    {
        list<account> UpdateAccounts = new List<account>();
        list<contact> contoUpdate = new list<Contact>();
        if(!recordsToProcess.isempty()){
            for(Account acc : recordsToProcess)
            {
                //Account acc = (Account) sobj;
                
               if(acc.Industry == 'FINANCE')
                {
                    acc.name = null;
                }
                acc.description = 'NEW-NEW-new -new --- This has been Updated due to the following Batch BatchApexNew2ToUpdateAccNSendEmailwithFailedRec';
                acc.annualrevenue =30;
                UpdateAccounts.add(acc);
                for(contact con : acc.contacts)
                {
                    con.lastname = acc.name;
                    contoUpdate.add(con);
                }
            }
                if(!UpdateAccounts.isemptY())
                {
                    Database.SaveResult [] saveResult = Database.Update(UpdateAccounts,false);
                    if(!saveResult.isemptY())
                    {
                        for(Database.SaveResult UpdatedRec : saveResult)
                        {
                            if(UpdatedRec.isSuccess()){
                                system.debug('Record Insertion is done with the following id --- '+ UpdatedRec.getId());
                                id idv1 = UpdatedRec.getId();
                                SuccessRecIDS.add(idv1);
                            }
                            else{
                              Database.Error [] err =  UpdatedRec.getErrors();

                              for(Database.error er : err )
                              {
                                  system.debug('Failed record id ---'+updatedRec.getId());
                                  id idv = UpdatedRec.getId();
                                FailedRecIDS.add(idv);
                              }
                            }
                        }
                    }
                }
                if(!contoUpdate.isemptY())
                {
                    Database.SaveResult [] saveResult = Database.Update(contoUpdate,false);
                    if(!saveResult.isemptY())
                    {
                        for(Database.SaveResult save : saveResult)
                        {
							if(save.isSuccess())
                            {
                                system.debug('Record Insertion is done with the following id --- '+ save.getId());
                                id idv1 = save.getId();
                                SuccessRecIDS.add(idv1);
                            }
                            else
                            {
                                Database.Error [] err =  save.getErrors();
                                	for(Database.error er : err )
                                  		{
                                      		id idv = save.getId();
                                            system.debug('Failed Record Details ---'+idv+'-----'+'reason'+er.getMessage());
                                    		FailedRecIDS.add(idv);
                              			}
                            }
                         }
                      }
                    }
                }
        }
    
    Global Void Finish(Database.BatchableContext bContext)
	{
        AsyncApexJob jobId = [select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from asyncapexjob where id=: bContext.getJobId()];
        	
        system.debug('Success Record IDS ---- '+SuccessRecIDS);
           Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
           string [] toAddresses = new string[]{jobId.createdby.email,'S.Jahid4444@gmail.com','zaahid4466@gmail.com'};
           
           email.setToAddresses(toAddresses);
           string Subject = 'This Email is basically to Notify about all the records which has been processed and failed along with the RECORD IDS';
           email.setSubject(subject);
    
           String setPlainTextBodyyy = 'This Email is basically to Notify about all the records which has been processed and failed along with the RECORD IDS' + '---SUCCESS IDS---'+ SuccessRecIDS + '----------FAILED rECORDS IDS ARE -----'+FailedRecIDS;
           email.setPlainTextBody(setPlainTextBodyyy);
    
           string setSenderDisplayNamee = 'Rehaans Regular Batch Process';
           email.setSenderDisplayName(setSenderDisplayNamee);
            string Replyto = 'Zaahid4466@gmail.com';
           email.setReplyTo(Replyto);
    
           Messaging.SendEmail(new Messaging.SingleEmailMessage[]{email});
       
    }
    global void execute(SchedulableContext sContext)
    {
        String CronExpression = '0 0 0 * * ? *';
        system.schedule('Scheduling Updates account batch', CronExpression,new BatchApex2ToUpdtAccNSendFaildRecEmail());
    }
}