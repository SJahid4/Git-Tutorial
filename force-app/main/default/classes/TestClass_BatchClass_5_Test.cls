@isTest
public class TestClass_BatchClass_5_Test 
{
    @isTest
    static void testMe()
    {  
        MyTestDataFactory.testdata();
        TestClass_BatchApex_5 test5 = new TestClass_BatchApex_5();
        Test.startTest();
        Id jobId = Database.executeBatch(test5,5);
        test.stopTest();
        Account acc = [select rating,ownership from account];
        system.assertEquals('Warm', acc.Rating);
        system.assertEquals('Private',acc.Ownership); 
    }
}