@isTest
public class TestClass_DmlOps_4_Test 
{
	@isTest
    public static void testMe()
    {
        TestClass_DmlOps_4 test4 = new TestClass_DmlOps_4();
        test4.method1();
        //each test class consider as there is no records inside the database.....which means if we are expecting a new record is getting inserted when we call
        //the above method then total records count should be only 1....that why we are verifying now using assertstatements whether the new record has inserted or not. 
        integer count = [select count() from account where name='Testing1'];
        system.assertEquals(1,count);
     }
    @isTest
    public static void testMe2()
    {
        account acc = new account();
        acc.Name = 'TestData';
        acc.Email__c='Testdata@gmail.com';
        acc.Rating='Cold';
        insert acc;
        TestClass_DmlOps_4 test4 = new TestClass_DmlOps_4();
        test4.method2();
        account acc1 = [select rating from account where createdDate=TODAY];
        system.assertEquals('Hot',acc1.Rating);
    }
    @isTest
    public static void method3()
    {
        MyTestDataFactory.testData();
        TestClass_DmlOps_4 test4 = new TestClass_DmlOps_4();
        test4.deletedata();
        integer count = [select count() from account where createdDate=TODAY];
        system.assertEquals(0,count);
    }
}