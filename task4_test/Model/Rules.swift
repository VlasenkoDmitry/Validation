import Foundation

struct Rules {
    
    let check: (String) -> ValidationLoginError?
    
    static let isEmpty = Rules(check: {
        return $0.isEmpty ? ValidationLoginError.incorrectLengthLogin : nil
    })
    
    static let wordLength = Rules(check: {
        return $0.count >= 3 && $0.count <= 32 ? nil : ValidationLoginError.incorrectLengthLogin
    })
    
    static let validEmail = Rules(check: {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.([A-Za-z]){2,3}").evaluate(with: $0) ? nil : ValidationLoginError.invalidEmail
    })

    static let firstLetterNickname = Rules(check: {
        return NSPredicate(format: "SELF MATCHES %@", "[0-9-.]").evaluate(with: String(Array($0)[0])) ? ValidationLoginError.invalidFirstLetterNickname : nil
    })
    
    static let fullFormatNickname = Rules(check: {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z-.]{1,}").evaluate(with: $0) ? nil : ValidationLoginError.invalidNickname
    })
}



