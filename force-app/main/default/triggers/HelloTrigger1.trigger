trigger HelloTrigger1 on Account (before insert) {
    if(trigger.isinsert && trigger.isBefore)
    {
        for(account acc : trigger.new)
        {
            acc.active__c = 'yes';
        }
    }
}