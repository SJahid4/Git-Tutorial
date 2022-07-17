public class TestClass_Dml_6 
{
	public void callMe()
    {
        user u = [select id,username,alias from user where alias='rreha'];
        
        List<opportunity> lstoppty = [select id,name,stagename,amount,closedate from opportunitY where ownerId=:u.Id];
        
        if(!lstoppty.isEmpty())
        {
            for(opportunity op : lstoppty)
            {
                op.stagename ='Closed Won';
                op.closedate = system.today()+15;
            }
            update lstoppty;
        }
    }
    public void deleteOpptys()
    {
		user u = [select id,username,alias from user where alias='rreha'];
        List<opportunity> lstOppty2 = [select id,name,stagename,amount,closedate from opportunitY where ownerId=:u.Id];  
        if(!lstoppty2.isempty())
        {
            delete lstoppty2;
        }
    }
}