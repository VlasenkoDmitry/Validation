import Foundation
import UIKit

class Validator {
    
    func validate(login: String) -> (result: Bool, error: PaginationLoginError?) {
        if let emptyResult = Rule.isEmpty.check(login) {
            return (false, emptyResult)
        } else {
            var rules = [Rule]()
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
    
    private func emailRules() -> [Rule] {
        return [Rule.wordLength, .validEmail]
    }
    
    private func nicknameRules() -> [Rule] {
        return [Rule.wordLength, .firstLetter, .nickname]
    }
}



