public class TokenGeneratorController {
    public String verificationResult { get; set; }
    
    public TokenGeneratorController() {
        // Constructor
        verifyToken();
    }

    public void verifyToken() {
        // Retrieve the token from the URL
        String token = ApexPages.currentPage().getParameters().get('token');

        if (String.isNotBlank(token)) {
            // Perform your verification logic here based on the token
            // This might include querying a record with the token and updating its status
            
            // For example:
            if (token.equals('smsealsver-'+token)) {
                verificationResult = 'Token verification successful!';
            } else {
                verificationResult = 'Invalid token.';
            }
        } else {
            verificationResult = 'Token not provided.';
        }
    }

}