import Foundation
import UIKit

class Validator {
    
    func validate(login: String) -> (result: Bool, error: ValidationLoginError?) {
        if let emptyResult = Rules.isEmpty.check(login) {
            return (false, emptyResult)
        } else {
            var rules = [Rules]()
            if login.contains("@") {
                rules = emailRules()
            } else {
                rules = nicknameRules()
            }
            
            let mainValidationError = rules.compactMap({ $0.check(login) }).first
            if mainValidationError == nil {
                return (true, nil)
            } else {
                return (false, mainValidationError)
            }
        }
    }
    
    private func emailRules() -> [Rules] {
        return [Rules.wordLength, .validEmail]
    }
    
    private func nicknameRules() -> [Rules] {
        return [Rules.wordLength, .firstLetterNickname, .fullFormatNickname]
    }
}



