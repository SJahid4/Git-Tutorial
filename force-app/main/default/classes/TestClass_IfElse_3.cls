public class TestClass_IfElse_3 
{
	public string industry;
    public string rating;
    public string ownership;
    
    public void testMe()
    {
        if(industry =='Banking')
        {
            rating = 'hot';
            ownership ='public';
        }
        else
        {
            rating ='warm';
            ownership='private';
        }
    }
}