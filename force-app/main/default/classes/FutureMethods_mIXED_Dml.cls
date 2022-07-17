public class FutureMethods_mIXED_Dml 
{
/*	public static void MixedDmlExceptions()
    {
        
        User u = [select id,username,isactive from user where username = 'rehaan4@cognizant.com' limit 1];
        if(u != null)
        {
            u.IsActive = false;
            update u;
        }
        Account acc = [select id,name from account limit 1];
        
        if(acc != null)
            
        {
            acc.Name = 'Mixed Dml';
            update acc;
        }
      
        
    }
*/  
    
    @Future
    public static void UsingFutureMethods()
    {
         Account acc = [select id,name from account limit 1];
        
        if(acc != null)
            
        {
            acc.Name = 'Mixed Dml22';
            update acc;
            system.debug(acc);
        }
    }
    
    
    public static void FutureAnnotedMethod()
    {
     	User u = [select id,username,isactive from user where username = 'rehaan4@cognizant.com' limit 1];
        if(u != null)
        {
            u.IsActive = false;
            update u;
            system.debug(u);
        }
   
    }
    
}