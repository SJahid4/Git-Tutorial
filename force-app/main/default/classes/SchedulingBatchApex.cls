Global class SchedulingBatchApex implements System.Schedulable
{
	Global void Execute(System.schedulableContext sContext)
    {
        BatchApexProgramming2 batch = new BatchApexProgramming2();
        Database.executeBatch(batch,5);
    }
}