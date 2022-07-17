/*
 * @Author : S Jahid 
 * @Description : This class is used to Practise Exception Handling Methods
 * @CreatedBy : 10 July, 2022
 * @Version : 1.0
 * @Reference : N/A 
 * Modified By :
 * 			Modified By			Modified Date			Reason
 * 			--------------------------------------------------
 * 
 */
public class ExceptionHandlingUtility 
{
/*
 * @Method : ExceptionHandling 
 * @Description : This class is used to Practise Exception Handling Methods
 * @Parameters : N/A 
 * @ReturnType : VOID
 * @Exceptions : DML EXceptions
 * @Reference : N/A
 * @Version : 1.0
 * 
 */ 		   
    
	public static void ExceptionsHandling()
    {
     	Account acc = new account();
        integer i;
        Account accdetails;
        List<string> lstaccounts = new List<string>();
        String s;
        
        Try
        {
            //Used to check DML Exception
            acc.Name = 'ExceptionHandlingTesting3';
            acc.Email__c = 'jbs@mail.com';
            insert acc;
            
            
            //To Check MATH Exception
            i = 250/2;
            system.debug(i);
            system.debug('-----------------');
            
            //To check Query Exception
            //accdetails = [select id,name from account];
            //system.debug(accdetails);
            
            //To Check the List Exception
            lstaccounts.add('One');
            lstaccounts.add('Two');
            lstaccounts.add('Three');
            system.debug('4th element --- '+lstaccounts.get(2));
            system.debug('-----------------');
            
            //To check NUll pointer exception
            s.contains('str');
        }
        catch(DMLexception ex)
        {
            system.debug('Get Message --- '+ ex.getMessage());
            system.debug('Get Cause --- '+ ex.getCause());
            system.debug('Get StackTraceString--- '+ ex.getStackTraceString());
            system.debug('Get Type Name--- '+ ex.getTypeName());
            system.debug('Get LineNumber--- '+ ex.getLineNumber());
            
        }
        catch(MathException ex)
        {
             system.debug('Get Message --- '+ ex.getMessage());
            system.debug('Get Cause --- '+ ex.getCause());
            system.debug('Get StackTraceString--- '+ ex.getStackTraceString());
            system.debug('Get Type Name--- '+ ex.getTypeName());
            system.debug('Get LineNumber--- '+ ex.getLineNumber());
        }
        catch(ListException ex)
        {
             system.debug('Get Message --- '+ ex.getMessage());
            system.debug('Get Cause --- '+ ex.getCause());
            system.debug('Get StackTraceString--- '+ ex.getStackTraceString());
            system.debug('Get Type Name--- '+ ex.getTypeName());
            system.debug('Get LineNumber--- '+ ex.getLineNumber());
        }
         catch(QueryException ex)
        {
             system.debug('Get Message --- '+ ex.getMessage());
            system.debug('Get Cause --- '+ ex.getCause());
            system.debug('Get StackTraceString--- '+ ex.getStackTraceString());
            system.debug('Get Type Name--- '+ ex.getTypeName());
            system.debug('Get LineNumber--- '+ ex.getLineNumber());
        }
         catch(NullpointerException ex)
        {
            system.debug('Get Message --- '+ ex.getMessage());
            system.debug('Get Cause --- '+ ex.getCause());
            system.debug('Get StackTraceString--- '+ ex.getStackTraceString());
            system.debug('Get Type Name--- '+ ex.getTypeName());
            system.debug('Get LineNumber--- '+ ex.getLineNumber());
        }
        finally
        {
            s = null;
        }
    }
}