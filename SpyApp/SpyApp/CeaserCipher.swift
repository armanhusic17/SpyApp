import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decrypt(_ plaintext: String, secret: String) -> String?
    
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded.uppercased()
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        
        guard let shiftBy = UInt32(secret) else {
            return "Must be >= 0"
        }
        
        var decrypted = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let UNDOshiftedUnicode = unicode - shiftBy + shiftBy
            let UNDOshiftedCharacter = String(UnicodeScalar(UInt8(UNDOshiftedUnicode)))
            decrypted = decrypted + UNDOshiftedCharacter
        }
        return decrypted.uppercased()
    }
 
    
}
