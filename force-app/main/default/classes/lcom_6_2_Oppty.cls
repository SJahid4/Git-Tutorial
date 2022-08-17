public with sharing class lcom_6_2_Oppty {
	@AuraEnabled
    public static Opportunity method1(Id accId, integer amount)
    {
	        Opportunity opp = [select id,name,Amount from opportunity where id=:accId];
        	return opp;
    }
    @AuraEnabled
    public static string method2(Id accId, integer amount)
    {
            string result; 
       if(schema.SObjectType.Opportunity.fields.amount.isUpdateable())
       {
            Opportunity Opp =[select id,name,amount from opportunity where id=:accId];
            Opp.Amount = amount;
            Update Opp;
            result = 'Opportunity has been Modified with the New AMOUNT Value '+Opp.Amount;
            return result;
       }
        else
        {
            return null;
        }
     }
        
}