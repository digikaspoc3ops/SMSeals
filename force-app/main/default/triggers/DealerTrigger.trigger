trigger DealerTrigger on Dealer__c (before insert) {
    switch on Trigger.operationType{
        when before_insert{
            DealerTriggerHandler.invokeTokenGenerator(Trigger.New);
        }
    }
    
}