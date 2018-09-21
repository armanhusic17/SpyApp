//
//  SimpleCipher.swift
//  SpyApp
//
//  Created by Arman Husic on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct SimpleCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode3 = unicode + shiftBy
            let shiftedSpecial = "!@#$"
            let shiftedCharacter3 = String(UnicodeScalar(UInt8(shiftedUnicode3)))
            encoded = encoded + shiftedCharacter3 + shiftedSpecial
        }
        return encoded.uppercased()
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return "Must enter secret digit "
        }
        
        var decrypted = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.last!.value
            let UNDOshiftedUnicode = unicode - shiftBy + 1
            
            let UNDOshiftedCharacter = String(UnicodeScalar(UInt8(UNDOshiftedUnicode)))
            decrypted = decrypted + UNDOshiftedCharacter
        }
        return decrypted.uppercased()
    }
    
    
}
