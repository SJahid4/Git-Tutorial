trigger AccountsTrigger on Account(Before Insert, After Insert, Before Update, After Update,Before Delete, After Delete, After Undelete) 
{
    system.debug('uh-ho Its to Check whether Im Being Called or not Before Insert'); 
    //BEFORE INSERT LOGIC TO BE WRITTEN IN THIS BELOW BLOCK.
    //SCENARIO - 1 : While Useer Creating an Account, if user provides Billing Address but not Shipping Address, Write a logic to 
    //populate BillingAddress details with Shipping Address fields.

    //SCENARIO - 2 : Validate AnnualRevenue value, it can't be less than $1000. Throw an Error If it's less than the specified amount.
    //Whenever we are trying to Validate data or populating some of the columns data in the same object we need to use BEFORE Events.
    
    //SCENARIO - 3 : When a User has Created an Account record, write a logic to create CONTACT with the same Account name and Associate 
    //account and contact....how can we achieve this.
    //Object : ACCOUNT.
    //Operation : INSERT.
    //Event : After
	
    //SCENARIO -4 : When user updates Account Record, if user changes account name, throw an error "Account name once created cannot be modified"
	//Object : ACCOUNT.
    //Operation : UPDATE.
    //Event : Before
    
    //SCENARIO -5 : On User Updating Account Record, if Billing address is Changed, update all its child contacts mailing address field same as account 
    //Billing address.
    //Object : Account.
    //Operation : Update
    //Event : After
    
    //SCENARIO - 6 : I dont want any of our Active Records to be deleted. If Active status is YES then throw an error
    //Object : Account
    //Operation : Delete
    //Event : Before
    
	//SCENARIO - 7 : Send an Email Notificatin to the owner after Deleting an ACCOUNT RECORD.
    //Object : Account
    //Operation : Delete
    //Event : AFTER

    //SCENARIO - 8 : Send an Email Notificatin to the owner after UNDELETING an ACCOUNT RECORD.
    //Object : Account
    //Operation : UNDelete
    //Event : AFTER
    If(Trigger.isInsert && Trigger.isBefore)
    {
        //SCENARIO -- 1 && 2
        //PrePopulate Shipping Address from BIlling Address
        AccountsTriggerHandler.beforeInsertHandler(Trigger.New);
    }
	
    If(Trigger.isAfter && Trigger.isInsert)
        {
            //SCENARIO -- 3	
			AccountsTriggerHandler.afterInsertCreateContact(Trigger.New);	            
        }
    
    If(Trigger.isBefore && Trigger.isUpdate)
    {
        //SCENARIO -- 4 
        //Using both Trigger.New and Trigger.Old List Collections also we can verify the changes in Name or in any fields....
        /*for(Account accNew : Trigger.New)
        {
            for(Account accOld : Trigger.Old)
            {
                if(accNew.Name != accOld.Name)
                {
                    accNew.addError('Account Name Once Created Can not be Modified');
                }
            }
        }*/
        
        //Verifying using MapCollections
        AccountsTriggerHandler.toCheckAccNameGotChangedOrNOT(Trigger.New,Trigger.OldMap);
      }
	//AFTER UPDATE LOGIC TO BE WRITTEN IN THIS BELOW BLOCK..
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        //SCENARIO -- 5
        for(Account accRecNew : Trigger.New)
        {
            if(accRecNew.BillingStreet != Trigger.oldMap.get(accRecNew.Id).BillingStreet || accRecNew.BillingCity != Trigger.OldMap.get(accRecNew.Id).BillingCity)
            {
                list<account> lstacc = [select id,BillingStreet, BillingCity,BillingState,BillingCountry,BillingPostalCode, (select id,Mailingstreet,MailingCity,MailingCountry,MailingState,MailingPostalCode from contacts) from account where id IN : Trigger.NewMap.keySet()];
				list<contact> contactsToUpdate = new List<contact>();
                IF(lstacc.size() >0)
                {
                    for(account acc : lstacc)
                    {
                        list<contact> childcons = acc.contacts;
                        for(contact con : childcons)
                        {
                            con.MailingCity = acc.BillingCity;
                            con.MailingStreet = acc.BillingStreet;
                            con.MailingCountry = acc.BillingCountry;
                            con.MailingPostalCode = acc.BillingPostalCode;
                            con.MailingState = acc.BillingState;
                            contactsToUpdate.add(con);	                            
                        }
                    }
                    if(contactsToUpdate.size() >0)
                    {
                        UPDATE contactsToUpdate; 
                    }
                }
            }
        }
    }
    
    //BEFORE DELETE LOGIC TO BE WRITTEN IN THIS BELOW BLOCK..
    if(Trigger.isBefore && Trigger.isDelete)
    {
        //SCENARIO -- 6
        for(Account acc : Trigger.Old)
        {
            //Trigger.New is not applicable on delete operations.
            if(acc.Active__c == 'Yes')
            {
                acc.addError('You are Not AUTHORIZED to Delete Active Accounts');
            }
        }
    }
    
    // AFTER DELETE LOGIC TO BE WRITTEN IN THIS BELOW BLOCK.
    if(Trigger.isDelete && Trigger.isAfter)
    {
        //SCENARIO -- 7
        List<Messaging.SingleEmailMessage> email = new list<Messaging.SingleEmailMessage>();
        for(Account acc : Trigger.Old)
        {
            Messaging.SingleEmailMessage newEmail = new Messaging.SingleEmailMessage();
            list<string> toaddresses = new list<string>();
            toaddresses.add(userinfo.getUserEmail());
            toaddresses.add('S.Jahid4444@gmail.com');
            toaddresses.add('zaahid4466@gmail.com');
            newEmail.setToAddresses(toaddresses);
            newEmail.setSubject('There is No Proper Subject and Body in this EMAIL');
            newEmail.setPlainTextBody('No Email Content...Thank YOU');
            newEmail.setSenderDisplayName('This has been fire using TRIGGERS');
            email.add(newEmail);
        }
        if(email.size() > 0)
        {
            Messaging.sendEmail(email);
        }
    }
    
    if(Trigger.isAfter && Trigger.isUndelete)
    {
        //SCENARIO -- 8
        //Send Email to user who Restores Record.
        //
        List<Messaging.SingleEmailMessage> email = new list<Messaging.SingleEmailMessage>();
        for(Account acc : Trigger.New)
        {
            Messaging.SingleEmailMessage newEmail = new Messaging.SingleEmailMessage();
            list<string> toaddresses = new list<string>();
            toaddresses.add(userinfo.getUserEmail());
            toaddresses.add('S.Jahid4444@gmail.com');
            toaddresses.add('zaahid4466@gmail.com');
            newEmail.setToAddresses(toaddresses);
            newEmail.setSubject('This is to Notify that your Account hasbeen Restored Successfully');
            newEmail.setPlainTextBody('No Email Content...Thank YOU');
            newEmail.setSenderDisplayName('This is to Notify that your Account hasbeen Restored Successfully');
            email.add(newEmail);
        }
        if(email.size() > 0)
        {
            Messaging.sendEmail(email);
        }
    }
    /*
    //reference -- SFDC panther+ channel test class video   
    if(Trigger.isDelete && Trigger.isBefore)
    {
        AccountsTriggerHandler.handleBeforeDelete(Trigger.old, Trigger.oldMap);       
    }
    
    //Before Insert, Before Update,Before Delete, After Update....these are the events used for below methods.
    
     * Below steps are written to call emailservice class
    if(Trigger.isInsert && Trigger.isAfter)
    {
        PractiseUtility2_EmailServices.TestingEmailServices(Trigger.NewMap);
    }
    
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        for(Account acc : Trigger.New)
        {
            if(acc.Industry == 'Banking')
            {
                acc.annualrevenue = 5000000;
            }
            else if(acc.Industry == 'Finance')
            {
                acc.annualrevenue = 4000000;
            }
             else if(acc.Industry == 'Insurance')
            {
                acc.annualrevenue = 3000000;
            }
             else if(acc.Industry == 'HealthCare')
            {
                acc.annualrevenue = 2500000;
            }
             else
            {
                acc.annualrevenue = 1000000;
            }
        }
    }
     if(Trigger.isDelete && Trigger.isBefore)
    {
        for(account ac : Trigger.old)
        {
            if(ac.active__c == 'yes')
            {
                ac.addError('****You are not Authorized to Delete Active Account Records****');
            }
        }
    }
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        for(account a : Trigger.New)
        {
            Integer Count = [select count() from account where name =: a.name];
            
            if(count>1)
            {
                a.addError('*********Duplicate Record on the Same Name has been already Found*********');
            }
        }       
    }
    if(Trigger.isBefore && Trigger.isDelete)
    {
         list<contact> lstcons = [select id,accountid from contact where accountid IN : Trigger.oldMap.Keyset()];
            
        if(!lstcons.isempty())
            {
                for(contact c : lstcons)
                {
                    c.accountid = null;
                }
                update lstcons;
            }
        
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        
        list<account> lstac = [select id,phone,fax,(select id,phone,fax from Contacts) from account where ID IN : Trigger.NewMap.keyset()];
        list<contact> lstcon = new list<contact>();
        if(!lstac.isempty())
        {
            for(account acc : lstac)
            {
                for(contact con : acc.contacts)
                {
                    con.Phone = acc.Phone;
                    con.Fax = acc.Fax;
                    lstcon.add(con);
                }
            }
            if(!lstcon.isempty())
            {
                update lstcon;
            }
        }
    } */
}