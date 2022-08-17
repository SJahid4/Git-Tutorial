public with sharing class AccountService 
{
    public static Account mthodname(string name,string description)
    {
        Account newAcc = new account();
        //try {
            newAcc.name = name;
            newAcc.description = description;
            newAcc.email__c='email@email.com';
        // insert acc;
       // system.debug('Account details -----'+ acc);
        return newAcc;
        /*
    } catch (DMLException ex) {
            system.debug('Error Message ---- '+ex.getMessage());
            return null;
        }
        Finally
        {
             acc=null;
                
        }
        */
                
    }    
}