public with sharing class ToTestMultipleMethodsCanbeCalledorNot 
{
    @AuraEnabled
	public static string method1()
    {
        string result ='It is written in Method ---- 1';
        return result;
    }
    
    @AuraEnabled
    public static string method2()
    {
        string result ='It is written in Method ---- 2';
        return result;
    }
    
}