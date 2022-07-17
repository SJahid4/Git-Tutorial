public class CustomSettings_CustomMetadata 
{
	public static void CustomsettingsData()
    {
        list<CountryPhoneCodes__c> phonecodes = CountryPhoneCodes__c.getall().values();
        if(!phonecodes.isEmpty())
        {
            system.debug('No of elements are --- '+phonecodes.size());
            for(CountryPhoneCodes__c codes : phonecodes)
            {
                system.debug(codes);
            }
        }
        
        system.debug('-----------------Using SOQL queries also we can retrive the data from custom settings -------');
        
        list<CountryPhoneCodes__c> phonecodees = [select id,Name,Phone_Code__c from CountryPhoneCodes__c];
         if(!phonecodees.isEmpty())
        {
            system.debug('No of elements are --- '+phonecodees.size());
            for(CountryPhoneCodes__c codes : phonecodees)
            {
                system.debug(codes);
            }
        }
        
        system.debug('----------------------------Getting specific Record values using below steps');
    	
		CountryPhoneCodes__c phncode = CountryPhoneCodes__c.getInstance('INDIA');
		system.debug(phncode);        
    	/*
    	 * 
    	 *CustomSettings_CustomMetadata.CustomsettingsData();
		CountryPhoneCodes__c phonecode = CountryPhoneCodes__c.getInstance('Qatar');
		system.debug(phonecode);
        List<CountryPhoneCodes__c> phonecodes = CountryPhoneCodes__c.getAll().Values();
        for(CountryPhoneCodes__c c : phonecodes)
        {
            system.debug(c);
        } 				
		*/
        
        system.debug('------Hierarichal Custom Settings-------');
        
        AmazonFestiveOfferDiscount__c HierarCustSett = AmazonFestiveOfferDiscount__c.getinstance('00e5i000002L1RpAAK');
        system.debug('My Special Discount ----- '+HierarCustSett);
  		//check with this profile id as wel 00e5i000002L1RpAAK	          
    }
    public static void CustomMetaData1()
    {		
        system.debug('----Custom Setting Data----');
     	   List<CountryPhoneCodes__c> phonecode = [select id,name,Phone_code__c from CountryPhoneCodes__c];
        if(!phonecode.isempty())
        {
            system.debug('Size is ---' + phonecode.size());
            for(CountryPhoneCodes__c c : phonecode)
            {
                system.debug(c);
            }
        }
        
         system.debug('----Custom Metadata Data----');
         system.debug('----Custom Setting Data----');
        
         List<CountryPhoneCodes_c__mdt> phonecode2 = [select id,MasterLabel,Phone_code__c from CountryPhoneCodes_c__mdt];
        if(!phonecode2.isempty())
        {
            system.debug('Size is ---' + phonecode2.size());
            for(CountryPhoneCodes_c__mdt c : phonecode2)
            {
                system.debug(c);
            }
        }
    }
}