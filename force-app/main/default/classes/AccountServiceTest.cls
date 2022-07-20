@isTest(seeAllData=false)
public class AccountServiceTest {
    @isTest
    public static void TestMethod1() {
        string name='TestName1';
        string description = 'Fuck';
        
        Test.startTest();
        Account newAcc = AccountService.mthodname(name,description);
        insert newAcc;
        Test.stopTest();
        system.debug('New Account --- '+newAcc);

        List<Account> lstacc = [select id,name,description from account];
        system.assertEquals(1,lstacc.size(),'should have only one record');
        system.assertEquals(name,lstacc[0].name,'Name must be Testname1');
        system.assertEquals(description, lstacc[0].description, 'Annualrevenue is not matched');


    }
}
