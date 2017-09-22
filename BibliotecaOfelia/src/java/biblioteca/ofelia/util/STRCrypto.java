package biblioteca.ofelia.util;
 
import java.io.*;
import javax.crypto.*;
import java.security.*;
import javax.crypto.spec.*;
import java.security.spec.*;

public class STRCrypto {

    Cipher ecipher, dcipher;

    public STRCrypto(String passPhrase) {

        //Codigo 8-bytes
        byte[] salt = { (byte)0xA9, (byte)0x9B, (byte)0xC8, (byte)0x22,
            			(byte)0x59, (byte)0x3B, (byte)0xC3, (byte)0x02 };

        // Contador de iteracion
        int iterationCount = 19;

        try {		

            KeySpec keySpec = new PBEKeySpec(passPhrase.toCharArray(), salt, iterationCount);
            SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(keySpec);

            ecipher = Cipher.getInstance(key.getAlgorithm());
            dcipher = Cipher.getInstance(key.getAlgorithm());

            // Prepara los parametros del cipthers
            AlgorithmParameterSpec paramSpec = new PBEParameterSpec(salt, iterationCount);

            ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);
            dcipher.init(Cipher.DECRYPT_MODE, key, paramSpec);

        } catch (InvalidAlgorithmParameterException e) {
            System.out.println("EXCEPTION: InvalidAlgorithmParameterException");
        } catch (InvalidKeySpecException e) {
            System.out.println("EXCEPTION: InvalidKeySpecException");
        } catch (NoSuchPaddingException e) {
            System.out.println("EXCEPTION: NoSuchPaddingException");
        } catch (NoSuchAlgorithmException e) {
            System.out.println("EXCEPTION: NoSuchAlgorithmException");
        } catch (InvalidKeyException e) {
            System.out.println("EXCEPTION: InvalidKeyException");
        }
    }


    public String encrypt(String str) {
        try {
            
            byte[] utf8 = str.getBytes("UTF8"); // Cifra la Cadena usando utf-8 bytes           
            byte[] enc = ecipher.doFinal(utf8); 
                        
            return new sun.misc.BASE64Encoder().encode(enc);

        } catch (BadPaddingException e) {
        } catch (IllegalBlockSizeException e) {
        } catch (UnsupportedEncodingException e) {
        } catch (IOException e) {
        }
        return null;
    }


    public String decrypt(String str) {
        try {
            
            byte[] dec = new sun.misc.BASE64Decoder().decodeBuffer(str); //Decifra
            byte[] utf8 = dcipher.doFinal(dec);
            
            return new String(utf8, "UTF8");

        } catch (BadPaddingException e) {
        } catch (IllegalBlockSizeException e) {
        } catch (UnsupportedEncodingException e) {
        } catch (IOException e) {
        }
        return null;
    }
    
	public static void main(String[] args) {
		
	  STRCrypto desEncrypter = new STRCrypto("ndprVF14Jp8=");
	  
	  	try{	  	
	  	System.out.println("Driver :"+desEncrypter.encrypt("jdbc:oracle:thin:biblioteca/Ofelia#2017@localhost:1521:xe"));	  	
	  	 	System.out.println("Driver :"+desEncrypter.encrypt("123"));      
	  		
	  	}catch(Exception e){ 		System.out.println("e1:"+e.getMessage() );
	  	}
	  	
	}    


}       
