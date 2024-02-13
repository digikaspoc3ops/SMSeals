public class TokenGenerator {
    public static String generateToken() {
        // Add logic to generate a unique token (e.g., UUID)
      
        string generatedToken ='smsealsver'+String.valueOf(Crypto.getRandomLong());
        system.debug('Newly Generated Token :: '+generatedToken);
        return generatedToken;
        
    }

}