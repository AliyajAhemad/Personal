public class AccountTriggerhandler {

    public static Boolean isBatch = false;

    public static void beforeUpdate(List<Account> updatedAccounts){
        System.debug('is Batch Context? '+ isBatch);
        if(isBatch) return;

        for(Account acc: updatedAccounts){
            acc.AccountSource = 'Web';
        }
        
    }

    public static void afterUpdate(List<Account> updatedAccounts){
<<<<<<< HEAD
        System.debug('is Batch Context? '+ isBatch);
        if(isBatch) return;

        Set<Id> accountIds = new Set<Id>();
        for(Account acc: updatedAccounts){
           accountIds.add(acc.Id);
        }

        List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId IN: accountIds];

        System.debug('contacts : '+ contacts);
=======
        System.debug('is Batch Context? '+ isBatch);        
>>>>>>> cdbbb0636bebaf461bdad301ed9809895920da51
    }
}
