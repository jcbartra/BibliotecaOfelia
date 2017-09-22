/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import biblioteca.ofelia.util.*;

public class prueba_encriptado {
    
    public static void main(String[] args) {
        
        STRCrypto desEncrypter = new STRCrypto("ndprVF14Jp8=");
        
        String en=desEncrypter.encrypt("set");
        
        System.out.println("prueba encriptado "+en);
        
        String des=desEncrypter.decrypt("/zVH9wCPr/g=");
        
        System.out.println("prueba desencriptado "+des);
    }
    
}
