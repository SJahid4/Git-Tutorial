// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Rehaan';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

system.debug('Welcome to Salesforce Learning Platform');
List<account> lstac = ReturnAllAccountsClass.ReturnAllAccounts();
system.debug(lstac);

String Cron = '0 0 6 * * ? *';
ScheduleApex_UsingCRON schedulingap = new ScheduleApex_UsingCRON();
system.schedule('Scheduling From VS CODE Editor', cron,schedulingap);