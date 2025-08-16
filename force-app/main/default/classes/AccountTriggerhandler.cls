public class AccountTriggerhandler {

    public static Boolean isBatch = false;

    public static void beforeUpdate(List<Account> updatedAccounts){
        System.debug('is Batch Context? '+ isBatch);
        if(isBatch) return;

        for(Account acc: updatedAccounts){
            acc.AccountSource = 'Web';
        }
        
    }
}