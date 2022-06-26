//
//  ValidationEmail.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class ValidationEmail: Link, Branch {
    let text: String
    var emptyText: CheckEmptyText
    var wordLength: CheckWordLength
    var validEmail: CheckValidEmail

    required init(text: String) {
        self.text = text
        emptyText = CheckEmptyText(text: text)
        wordLength = CheckWordLength(text: text)
        validEmail = CheckValidEmail(text: text)
    }
    
    func start() -> (result: Bool, error: ValidationLoginError?) {
        emptyText.nextStep = wordLength
        wordLength.nextStep = validEmail
        
        let result = emptyText.check()
        if result.result == true {
            return (true, nil)
        } else {
            return (false, result.error)
        }
    }
}
