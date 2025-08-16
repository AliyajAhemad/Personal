@isTest()
public class AccountTriggerTest {
    @isTest
    public static void testBeforeUpdate() {
        // Create a list of accounts to simulate the trigger context
        List<Account> accountsToInsert = new List<Account>{
            new Account(Name = 'Test Account 1'),
            new Account(Name = 'Test Account 2')
        };

        insert accountsToInsert;

        // Query the inserted accounts to get their IDs
        List<Account> insertedAccounts = [SELECT Id, Name FROM Account WHERE Id IN :accountsToInsert];
        for(Account acc : insertedAccounts) {
            System.debug('Inserted Account: ' + acc.Name);
            acc.AccountSource = 'Test Source'; // Set a different source for testing
        }

        // update the accounts to trigger the before update logic
        Test.startTest();
        update insertedAccounts;
        Test.stopTest();
    }
}