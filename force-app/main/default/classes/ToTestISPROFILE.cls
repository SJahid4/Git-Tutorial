public class ToTestISPROFILE {
	public static void methodname()
    {
       list<user> lss = [select id,profileid,profile.name from user where id =: Userinfo.getUserId()];
        if(!lss.isEmpty())
        {
            if(lss[0].profile.Name == 'SYSTEM ADMINISTRATOR')
            {
                system.debug('IF BLOCK --Currently Logged in users profile is ---- '+lss[0].profile.name);
            }
            else
            {
                system.debug('ELSE BLOCK -- Currently logged in user profile is ---- '+ lss[0].profile.name);
            }
        }
    }
    public static void dataskew()
    {
        /*-list<account> lst = new list<account>();
        for(integer i=1; i<=10000; i++)
        {
            account acc = new account();
            acc.name='DataSkew'+i;
            acc.Email__c='dataskew@gmail.com';
        	lst.add(acc);
        }
        insert lst;

*/			account acc = new account();
            acc.name='DataSkewNew';
            acc.Email__c='dataskew@gmail.com';
        	insert acc;
        	if(acc.id != null)
            {
             	  list<contact> sss = new list<contact>();
                  for(integer i=1; i<=10000; i++)
                    {
                        contact con = new contact();
                        con.lastname='dataskew'+i;
                        con.accountid=acc.Id;
                    	sss.add(con);
                    }   
                insert sss;
                	
            }

      
    }
}