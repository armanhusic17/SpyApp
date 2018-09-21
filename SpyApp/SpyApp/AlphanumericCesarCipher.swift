//
//  alphanumeric.swift
//  SpyApp
//
//  Created by Arman Husic on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct AlphanumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            
            
            if (unicode >= 97 && unicode <= 122) || (unicode >= 48 && unicode <= 57){
               
                
                if (shiftedUnicode > 57 && unicode <= 57){
                    shiftedUnicode += 39
                }
                if (shiftedUnicode > 122 && unicode <= 122) {
                    shiftedUnicode -= 75
                }
            
            }
            
//            if (unicode >= 65 && unicode <= 90) || (unicode >= 48 && unicode <= 57){
//                if (shiftedUnicode > 57 && unicode <= 64){
//                    shiftedUnicode -= 17
//                    unicode = 48
//                }
//                if (shiftedUnicode > 122 && unicode <= 122) {
//                    shiftedUnicode -= 75
//                }
//            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
      
            encoded = encoded + shiftedCharacter
            
            
            if !isAlphanumeric(input: plaintext){
                return "Please enter ALPHANUMERIC input. a-z A-Z 0-9"
            }
        }
        return encoded.uppercased()
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return "Must enter secret digit"
        }
        
        var decrypted = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let UNDOshiftedUnicode = unicode - shiftBy + 1
            let UNDOshiftedCharacter = String(UnicodeScalar(UInt8(UNDOshiftedUnicode)))
            decrypted = decrypted + UNDOshiftedCharacter
        }
        return decrypted.uppercased()
    }
    
  
    func isAlphanumeric(input: String) -> Bool {
        return input.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && input != ""
    }
   
}
