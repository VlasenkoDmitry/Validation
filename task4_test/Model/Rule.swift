import Foundation

struct Rule {
    
    let check: (String) -> PaginationLoginError?
    
    static let isEmpty = Rule(check: {
        return $0.isEmpty ? PaginationLoginError.incorrectLengthLogin : nil
    })
    
    static let wordLength = Rule(check: {
        return $0.count >= 3 && $0.count <= 32 ? nil : PaginationLoginError.incorrectLengthLogin
    })
    
    static let validEmail = Rule(check: {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.([A-Za-z]){2,3}").evaluate(with: $0) ? nil : PaginationLoginError.invalidEmail
    })

    static let firstLetter = Rule(check: {
        return NSPredicate(format: "SELF MATCHES %@", "[0-9-.]").evaluate(with: String(Array($0)[0])) ? PaginationLoginError.invalidNickname : nil
    })
    
    static let nickname = Rule(check: {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z-.]{1,}").evaluate(with: $0) ? nil : PaginationLoginError.invalidFirstLetterNickname
    })
}
