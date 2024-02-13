public class DealerTriggerHandler {
    public static void invokeTokenGenerator(List<Dealer__c>DealerLst){
        TokenGenerator.generateToken();
        for(Dealer__c dlr:DealerLst){
            dlr.Verification_Token__c = TokenGenerator.generateToken();
        }
        
        
    }

}