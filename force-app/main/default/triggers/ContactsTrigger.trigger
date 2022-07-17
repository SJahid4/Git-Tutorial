trigger ContactsTrigger on Contact (After Insert) 
{

    //To Test Recursive Triggers.......
    if(Trigger.isAfter && Trigger.isInsert && !ContactsTriggerHandler.isTriggerRan)
    {
        ContactsTriggerHandler.isTriggerRan = true;
        ContactsTriggerHandler.ContactsTriggerHandlerMethod(Trigger.New);
    }

    /*
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        for(Contact con : trigger.New)
        {
            if(con.Email == null)
            {
                con.email.adderror('Please Provide Valid Email Address');
            }
            else if(con.phone == null)
            {
                con.phone.adderror('Please Provide Valid 10 Digit Mobile Number');
            }
        }
    }
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        for(Contact con : trigger.New)
        {
            if(con.AccountId == null)
            {
                con.addError('**** Mandatory ---- Please Map contact with its parent Record');
            }
        }
    }
    */
    
   
}