trigger CallBatchThenFutureFromTrigger on Contact (After insert) {
	if(Trigger.isAfter && Trigger.isInsert)
        {
            NewTestBatchChaining2 abc = new NewTestBatchChaining2();
            Database.executeBatch(abc);
        }
}