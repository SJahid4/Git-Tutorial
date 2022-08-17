@isTest
public class TaskTriggerTest
{
	@isTest
	public static void method1()
	{
		Account acc = new Account();
		acc.Name = 'TestAccount';
        acc.Email__c='abc@aa.com';
		insert acc;
		
		task ts = new task();
		ts.description = 'My New task';
		ts.WhatId = acc.Id;
        ts.Status='Completed';
        ts.Subject='Call';
        ts.Priority='Normal';
		insert ts;
		
        
        Account acc1 = [select id,Description from account];
		task tsss = [select description from task where WhatId =: acc1.Id];
        System.AssertEquals(tsss.description, acc1.description,'Some Error Message');

        task tsToUpdate = [select whoId,description from task where WhatId =: acc1.Id];
		tsToUpdate.description = 'Updated Description';
		Update tsToUpdate;
		
        
		//Account acc2 = [select id,Description from account];
		Account accAfterUpudate = [select id,Description from account];
		task tsUpdated = [select id,description from task where WhatId =: accAfterUpudate.Id];
		
		
		System.AssertEquals(tsUpdated.description, accAfterUpudate.Description,'Some Error Message');
	}
}