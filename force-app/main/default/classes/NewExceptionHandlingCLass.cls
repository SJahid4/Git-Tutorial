public with sharing class NewExceptionHandlingCLass 
{
	public static void meethod()
    {

		list<string> ls = new list<string>();
        string s;
        //Account acc = new account();
        try{
            
        	//insert acc;
         //   system.debug('Result -'+250/0);
         //Account a = [select id from account];
         
        /*    ls.add('element');
            ls.add('element2');
            ls.add('element3');
            system.debug(ls.get(4)); */
            s.contains('str');
            
        }
        catch(DMLException ex)
        {
            system.debug(ex.getMessage());
        }
        catch(MathException ex)
        {
            system.debug(Ex.getMessage());
        }
        catch(QueryException ex)
        {
            system.debug(Ex.getMessage());
        }
        catch(ListException ex)
        {
            system.debug(Ex.getMessage());
        }
        catch(NullPointerException ex)
        {
            throw new NewExceptionHandlingClassException('This Error has been Occured Custom by using our Custom Exception');
            //system.debug(Ex.getMessage());
        }

        Finally
        {
            ls.clear();
            system.debug('Error occured class');
            
        }
    }
}