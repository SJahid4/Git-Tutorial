@isTest
public with sharing class HelloTrigger1_Test {
    @isTest
    public static void TestMe2() {
        Account acc = new account();
        acc.name='Testting2';
        acc.Email__c='test@gmail.com';
        acc.active__c='no';
        insert acc;

        account ac = [select id,name,active__c from account];
        system.assertEquals('Yes',ac.active__c);
    }
}