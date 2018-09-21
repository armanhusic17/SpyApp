import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "alphanumeric": AlphanumericCesarCipher(),
        "octavianCipher": OctavianCipher(),
        "simpleCipher": SimpleCipher()
        
        
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
   
}
