@isTest
public with sharing class ContactsTriggerHandlerTest {
    @isTest
    public static void ContactsTriggerHandlerTestMethod() {
        Contact con = new contact();
        con.lastname = 'Testing';
        insert con; 
        Integer Count = [select count() from contact ];
        system.debug('Count is --- '+count);
        //system.debug('Actual Records count is ---- ');
        system.assertEquals(2,count);
        
    }
}