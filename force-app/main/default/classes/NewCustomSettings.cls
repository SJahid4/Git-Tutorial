public class NewCustomSettings
{
    public static void methd()
    {
    	/* List<CountryPhoneCodes__c> CSetting = CountryPhoneCodes__c.getall().Values();
        
    if(!csetting.isEmpty())
    {
        for(CountryPhoneCodes__c c : csetting)
        {
        	system.debug(c);    
        }
        
    }
    
        CountryPhoneCodes__c india = CountryPhoneCodes__c.getInstance('INDIA');
        system.debug('INDIA COuntry code -- '+india);
    
    AmazonFestiveOfferDiscount__c Hrr = AmazonFestiveOfferDiscount__c.getvalues(userinfo.getUserId());
    	
            system.debug(Hrr);
    */
        
        List<CountryPhoneCodes_c__mdt> ss = [select id,label,phone_code__c from CountryPhoneCodes_c__mdt];
        system.debug(ss);
    }
    
    
	  
        
}