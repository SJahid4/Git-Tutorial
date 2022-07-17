@isTest
public class TestClass2_Test 
{
	@isTest
    public static void testMe()
    {
        TestClass2 test2 = new TestClass2();
        test2.setData();
        system.assertEquals('banking',test2.industry);
        system.assertEquals('hot',test2.rating);
        
    }
}