public with sharing class ReturnAllAccountsClass {
    public static List<Account> ReturnAllAccounts() {
        List<account> lstacc = [select id,name,rating from account where rating='Hot'];
        return lstacc;
    }
}