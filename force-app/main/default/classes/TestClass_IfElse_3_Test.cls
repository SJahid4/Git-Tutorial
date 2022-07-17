@isTest
public class TestClass_IfElse_3_Test 
{
	@isTest
    public static void testME()
    {
        TestClass_IfElse_3 test3 = new TestClass_IfElse_3();
        test3.industry = 'Banking';
        test3.testMe();
        system.assertEquals('hot', test3.rating);
        system.assertEquals('public',test3.ownership);
        test3.industry ='Finance';
        test3.testMe();
        system.assertEquals('warm',test3.rating);
        system.assertEquals('private',test3.ownership);
    }
}