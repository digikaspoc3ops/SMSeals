public class EmailVerificationController {
    public String verificationResult { get; set; }
    
    public EmailVerificationController() {
        // Constructor
    }
    
    public void verifyEmail() {
        // Retrieve the verification token from the URL
        String token = ApexPages.currentPage().getParameters().get('token');
        
        if (String.isNotBlank(token)) {
            // Query the Dealer record with the given token
            List<Dealer__c> dealers = [SELECT Id, Verification_Status_of_Mail__c FROM Dealer__c WHERE 
                                       Verification_Token__c = :token LIMIT 1];
            
            if (!dealers.isEmpty()) {
                // Update the Verification Status
                updateVerificationStatus(dealers[0]);
            } else {
                verificationResult = 'Invalid or expired verification token.';
            }
        }
    }
    
    private void updateVerificationStatus(Dealer__c dealer) {
        // Perform DML operation outside of the constructor
        try {
            dealer.Verification_Status_of_Mail__c = true;
            update dealer;
            verificationResult = 'Email verification successful!';
        } catch (Exception e) {
            verificationResult = 'Error updating verification status: ' + e.getMessage();
        }
    }
}