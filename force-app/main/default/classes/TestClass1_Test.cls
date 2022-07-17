@isTest
public class TestClass1_Test 
{
	@isTest
    public static void testMe()
    {
        TestClass1 test1 = new TestClass1();
        test1.invoke();
        system.assertEquals('Samkiran', test1.name);
        system.assertEquals('Hyderabad', test1.city);
        test1.call();
     	system.assertEquals('Praveen', test1.name);
        system.assertEquals('Bangalore', test1.city);   
    }
}