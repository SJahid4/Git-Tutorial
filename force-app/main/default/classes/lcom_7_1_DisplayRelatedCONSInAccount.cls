public with sharing class lcom_7_1_DisplayRelatedCONSInAccount 
{
    @AuraEnabled
    public static List<contact> retrieveChildContacts(Id accId) 
    {
        list<contact> Conlist = [select id,firstname,lastname from contact where accountId =:accId];
        return Conlist;
    }
    @AuraEnabled
    public static void updateRelatedList(list<contact> UpdateCons){
        if(UpdateCons !=null && UpdateCons.size()>0)
        {	
            system.debug('ID--'+updatecons[0].id);
            system.debug('firstname -- '+ updatecons[0].firstname);
            system.debug('firstname -- '+ updatecons[0].lastname);
            system.debug('firstname -- '+ updatecons[1].firstname);
            system.debug('firstname -- '+ updatecons[1].lastname);
            system.debug('size of conts to update -- '+UpdateCons.size());
            Update UpdateCons;
        }
    }
}