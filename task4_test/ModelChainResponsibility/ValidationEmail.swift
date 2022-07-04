//
//  ValidationEmail.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class ValidationEmail: Link, Branch {
    private let text: String
    private let emptyText: CheckEmptyText
    private let wordLength: CheckWordLength
    private let validEmail: CheckValidEmail

    required init(text: String) {
        self.text = text
        emptyText = CheckEmptyText(text: text)
        wordLength = CheckWordLength(text: text)
        validEmail = CheckValidEmail(text: text)
    }
    
    func start() -> (result: Bool, error: ValidationLoginError?) {
        emptyText.setNextStep(nextStep: wordLength)
        wordLength.setNextStep(nextStep: validEmail)
        
        let result = emptyText.check()
        if result.result == true {
            return (true, nil)
        } else {
            return (false, result.error)
        }
    }
}
