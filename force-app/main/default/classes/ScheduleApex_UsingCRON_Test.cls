@isTest
public class ScheduleApex_UsingCRON_Test {
    @isTest
    public static void testMe()
    {
        MyTestDataFactory.testdata();
        String CronExp = '0 0 5 * * ? *';
        ScheduleApex_UsingCRON Scheduling = new ScheduleApex_UsingCRON();
        Test.startTest();
        Id jobId = System.schedule('jobName', CronExp, Scheduling);
        Test.stopTest();
        Integer count = [select count() from account];
        system.assertEquals(0,count);         
        CronTrigger ct = [select id,Cronexpression from CronTrigger where id=:jobId];
        system.assertEquals(Cronexp, ct.cronexpression);
        
    }
}