public with sharing class AccountService 
{
    public static Account mthodname(string name,string description)
    {
        Account acc = new account();
        try {
        acc.name = name;
        acc.description = Name;
        insert acc;
        system.debug('Account details -----'+ acc);
        return acc;
        } catch (DMLException ex) {
            system.debug('Error Message ---- '+ex.getMessage());
            return null;
        }
        Finally
        {
             acc=null;
                
        }
                
    }    
}
