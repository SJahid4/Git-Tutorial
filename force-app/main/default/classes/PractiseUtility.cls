/*
 * @Author : S Jahid
 * @Description : This Class is used to Insert the Dummy records into ACcount Object to check the Difference between DML Statements and DatabaseClassMethods to see how Partial Processing Works.
 * @Version : 1.0 
 * Created Date : July 09, 2022
 * Reference : NO Reference as of now
 * Modified By
 * 		Modified By			 Modified Date			Reason
 *		-------------------------------------------------- 
 *
 */

public class PractiseUtility 
{
    /*
     * @Method Name : dmlOpUsngStatementsandDatabaseClasses  
     * @Description : To see how partial processing works by using DatabaseClass methods.
     * @Parameters : noofrecords
     * @Version : 1.0
     * @Returns : N/A 
     * @Throws : DML Exceptions
     * @Reference : 
     * 
     */
    
	public static void dmlOpUsngStatementsandDatabaseClasses(integer noofrecords)
    {
        if(noofrecords >0)
        {
            list<account> lstaccounts = new list<account>();
            
            for(integer i=1; i<=noofrecords; i++)
            {
                Account acc = new Account();
                if(i != 88)
                {
                    acc.Name = 'TestingOutboundEmailsServices -- '+i;
                }
                acc.phone='8520852020';
                acc.Active__c='yes';
                acc.Industry='Banking';
                acc.email__c = 'S.Jahid4444@gmail.com';
                
                lstaccounts.add(acc);
            }
            if(!lstaccounts.isEmpty())
            {
                system.debug('Size of the collection is --- '+lstaccounts.size());
                //insert lstaccounts;
             	
                //By Using this DataBaseClass Methods allows us to track the results && allows the Partial Processing also.
                Database.SaveResult [] saveresults = Database.insert(lstaccounts,false);
                if(!saveresults.isempty())
                {
                    for(Database.SaveResult res : saveresults)
                    {
                        if(res.isSuccess())
                        {
                            system.debug('Record Insertion is processed with the following record id --- '+res.getId());
                        }
                        else
                        {
                            Database.Error [] err = res.getErrors();
                            if(!err.isempty())
                            {
                                for(Database.Error er : err)
                                {
                                    system.debug('Error message is --- '+er.getMessage());
                                    system.debug('Error status code is --- '+er.getstatuscode());
                                    system.debug('Error Occured fields ----'+er.getFields());
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    public static void ClearingRecycleBin()
    {
		list<account> accountsToDelete = [select id,name from account where name like 'Testing%'];
        if(!accountstodelete.isEmpty())
        {
            system.debug('No of records about to delete are ---'+accountstodelete.size());
            delete accountstodelete;
            Database.emptyRecycleBin(accountstodelete);
        }
    }
    public static void SOSLQuery()
    {
        list<list<sObject>> resultset = [FIND 'Test*' IN ALL FIELDS RETURNING
                                       		Account(id,name,rating,industry,active__c,type,description,phone,fax,annualrevenue),
                                        	Contact(accountid,firstname,lastname,phone,fax,email,homephone,title,department),
                                        	Opportunity(id,accountid,stagename,leadsource,type,amount,closedate),
                                        	Lead(id,title,salutation,firstname,lastname,phone,website,email,fax)
                                       		];
        if(!resultset.isempty())
        {
            system.debug('Size of the Collection is --- '+ resultset.size());
            list<account> lstacc = (list<account>) resultset.get(0);
            list<contact> lstcon = (list<contact>) resultset.get(1);
            list<Opportunity> lstop = (list<opportunity>) resultset.get(2);
            list<lead> lstld = (list<lead>) resultset.get(3);
            
            if(!lstacc.isempty())
            {
                system.debug('Accounts count ---- '+lstacc.size());
                for(account ac : lstacc)
                {
                    system.debug('Retrieved Account Details are --- '+ac);
                }
            }
            
        }
    }
    Public static void updateaccounts()
    {
        list<account>lstacon = [select id,annualrevenue from account where annualrevenue = null limit 30];
        if(!lstacon.isempty())
        {
            for(account ac : lstacon)   
            {
                ac.AnnualRevenue = 200000;
            }
            update lstacon;
        }
    }
    public static void AggregateFunctionsGroupByHaving()
    {
        AggregateResult [] aggreslt = [select industry,count(id) recordscount from account where industry !=null GROUP BY Industry having Count(id)>1];
        
        if(!aggreslt.isempty())
        {
            for(AggregateResult ag : aggreslt)
            {
                system.debug('Industry Name is --- '+ ag.get('Industry')+ 'Records count is --- '+ ag.get('recordscount'));
            }
        }
    }
    public static void sharingrules()
    {
        Account acc = new account(name='Testing Apex Sharing',active__c='yes',email__c='abc@gmail.com');
        insert acc;
        
        accountshare acshare = new accountshare();
        acshare.AccountId = acc.id;
        acshare.AccountAccessLevel = 'EDIT';
        //acshare.RowCause = Schema.accountshare.rowcause.Requested_By_Client;
        acshare.UserOrGroupId = '0055i000004SZmLAAW';
        acshare.OpportunityAccessLevel='EDIT';
        acshare.CaseAccessLevel='EDIT';

        insert acshare; 
    }
}