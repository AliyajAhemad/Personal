trigger AccountTrigger on Account (before update, after update) {
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerhandler.beforeUpdate(Trigger.new);
        }
    }
}