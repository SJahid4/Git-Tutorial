Global class ScheduleApex_UsingCRON implements schedulable 
{
    Global void Execute(schedulableContext sContext) 
    {
        List<Account> lstacc = [select id,name,rating,active__c from account where createdDate=TODAY];
        if(!lstacc.isempty())
        {
            delete lstacc;
        }
    }
}