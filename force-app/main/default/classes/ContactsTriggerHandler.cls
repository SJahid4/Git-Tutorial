public with sharing class ContactsTriggerHandler {
    public static Boolean isTriggerRan = false;
    public static void ContactsTriggerHandlerMethod(list<contact> UndeleterecordsToProcess) {
        
        if(!UndeleterecordsToProcess.isempty())
        {
            list<contact> lstcon = new list<Contact>();
            for(Contact con : UndeleterecordsToProcess)
            {
                Contact conNew = new contact();
                conNew.lastname = 'Recursive Trigger';
                lstcon.add(conNew);
            }
            if(lstcon.size() > 0)
            {
                Insert lstcon;
            }
        }
    }
}