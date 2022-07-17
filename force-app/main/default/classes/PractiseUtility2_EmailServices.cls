public class PractiseUtility2_EmailServices 
{
	 public static void TestingEmailServices(Map<Id,account> lstaccc)
     {
        if(!lstaccc.isempty())
        {
			List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
            
            for(account acc : lstaccc.values())
            {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                
                String [] emailids = new String[]{acc.email__c,'Rehaan6.rehaan4@gmail.com','S.Jahid4444@gmail.com'};
                email.setToAddresses(emailids);
                
                //SetCCAddresses and BccAddresses are not required
                
                String SenderdisplayName = 'Rehaans Testing Email Services';
                email.setSenderDisplayName(SenderdisplayName);
                
                String Setreplytoemail = 'rehaan4.rehaan6@gmail.com';
                email.setReplyTo(Setreplytoemail);
                
                String Subject = 'This is to Test OutBound Email Messaging Services';
                email.setSubject(Subject);
                
                String htmlbdy = 'Hi Dear @ -- '+Acc.Name +'--' + 'This Email is to Notify you about the new account creation on your behalf is successfully processed'+
                    				'Thank you for showing your intereset into our Organisation'+
                                        '<br/> --- Your Contact number -- '+acc.Phone;
                
                email.setHtmlBody(htmlbdy);
                
                emailsToSend.add(email);
            }
            
            if(!emailsToSend.isempty())
            {
                system.debug('No of emails aregoing to be sent  ---- '+ emailsToSend.size());
                
            //    Messaging.sendEmail(new Messaging.SingleEmailMessage[]{emailsToSend});
            }
 
        }
        
     }
    	
    
    public static void massemailmessages()
    {
        
        Map<Id,Account> mpaccounts = new map<id,account>([select id,name,email__c from account where name !=null and email__c !=null limit 5]);
        
        if(!mpaccounts.isEmpty())
        {
            system.debug('Size of Map -- '+mpaccounts.size());
            List<id> accids = new list<id>();
            accids.addAll(mpaccounts.keySet());
            
            if(!accids.isEmpty())
            {
                EmailTemplate tempid = [select id,name,isactive from emailtemplate where name='MassEmailMessagingTest' limit 1];
                
           
                if(tempid.Id !=null && tempid.IsActive == true)
                {
                    Messaging.MassEmailMessage email = new messaging.MassEmailMessage();
                    email.setTargetObjectIds(accids);
                    email.setTemplateId(tempid.Id);
                    
                    Messaging.sendEmail(new Messaging.MassEmailMessage[]{email});
                    
                }
            }
        }
        
    }
    public static void SentemailtoBatch(AsyncApexJob jobdetails, string jobname)
    {
        if(jobdetails != null)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
				
            
            String [] Toemail = new String[]{jobdetails.createdby.email, 'S.Jahid4444@gmail.com'};
			
            	email.setToAddresses(Toemail);
                
                //SetCCAddresses and BccAddresses are not required
                
                String SenderdisplayName = 'Rehaans Testing Email Services';
                email.setSenderDisplayName(SenderdisplayName);
                
                String Setreplytoemail = 'rehaan4.rehaan6@gmail.com';
                email.setReplyTo(Setreplytoemail);
                
                String Subject = 'This is to Test OutBound Email Messaging Services';
                email.setSubject(Subject);
            
            	String Plaintextbody = 'Thank you Created Batch Apex Job';
            	email.setPlainTextBody(Plaintextbody);
            Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
        }
    }
    
     public static void SendTotalAnnualrevenueToBatchOwner(AsyncApexJob jobdetails, string jobname,Decimal TotalAmount)
    {
        if(jobdetails != null)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
				
            
            	String [] Toemail = new String[]{jobdetails.createdby.email, 'S.Jahid4444@gmail.com'};
			
            	email.setToAddresses(Toemail);
                
                //SetCCAddresses and BccAddresses are not required
                
                String SenderdisplayName = 'Rehaans Testing Email Services';
                email.setSenderDisplayName(SenderdisplayName);
                
                String Setreplytoemail = 'rehaan4.rehaan6@gmail.com';
                email.setReplyTo(Setreplytoemail);
                
                String Subject = jobname;
                email.setSubject(Subject);
            
            	String Plaintextbody = 'Thank you for Creating BatchApex by maintaining Stateful Mechanisam to count the Total AnnualRevenue of all the ACCOUNTS ------ '+ 
                    					TotalAmount +'-------'+ 'Total No of Job Items are --------' + jobdetails.TotalJobItems;
            	email.setPlainTextBody(Plaintextbody);
            Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
        }
    }
}