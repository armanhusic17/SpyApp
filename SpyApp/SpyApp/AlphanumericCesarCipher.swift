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
        
        
        if plaintext.range(of: "[^a-zA-Z0-9]", options: .regularExpression) != nil && plaintext != ""{
            encoded = "Please enter ALPHANUMERIC input. a-z A-Z 0-9"
            return encoded
        }
        
        
        for character in plaintext.uppercased() {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            
            for _ in 0..<shiftBy {
                
                if shiftedUnicode == Unicode.Scalar("Z")?.value {
                    
                    shiftedUnicode = Unicode.Scalar("0").value
                
                }else if shiftedUnicode == Unicode.Scalar("9")?.value {
                    
                    shiftedUnicode = Unicode.Scalar("A").value
                
                }else {
                    shiftedUnicode += 1
                }
            }
            
            
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
        
        if plaintext.range(of: "[^a-zA-Z0-9]", options: .regularExpression) != nil && plaintext != ""{
            decrypted = "Please enter ALPHANUMERIC input. a-z A-Z 0-9"
            return decrypted
        }
        
        for character in plaintext.uppercased() {
            let unicode = character.unicodeScalars.last!.value
            var UNDOshiftedUnicode = unicode
                
            for _ in 0..<shiftBy {
                if  UNDOshiftedUnicode > Unicode.Scalar("Z").value {
                    
                    UNDOshiftedUnicode = Unicode.Scalar("0").value
                    
                }else if UNDOshiftedUnicode > Unicode.Scalar("9")!.value && UNDOshiftedUnicode < Unicode.Scalar("0")!.value   {
                    
                    UNDOshiftedUnicode = Unicode.Scalar("A").value
                    
                }else {
                    UNDOshiftedUnicode -= 1
                }
            }
            
            
            
            let UNDOshiftedCharacter = String(UnicodeScalar(UInt8(UNDOshiftedUnicode + shiftBy)))
            decrypted = decrypted + UNDOshiftedCharacter
        }
        return decrypted.uppercased()
    }
    
  
    func isAlphanumeric(input: String) -> Bool {
        return input.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && input != ""
    }
   
}
