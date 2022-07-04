//
//  ValidationNickname.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class ValidationNickname: Link, Branch {
    private let text: String
    private let emptyText: CheckEmptyText
    private let wordLength: CheckWordLength
    private let firstLetterNickname: CheckFirstLetterNickname
    private let fullFormatNickname: CheckFullFormatNickname
    
    required init(text: String) {
        self.text = text
        emptyText = CheckEmptyText(text: text)
        wordLength = CheckWordLength(text: text)
        firstLetterNickname = CheckFirstLetterNickname(text: text)
        fullFormatNickname = CheckFullFormatNickname(text: text)
    }
    
    func start() -> (result: Bool, error: ValidationLoginError?) {
        emptyText.setNextStep(nextStep: wordLength)
        wordLength.setNextStep(nextStep: firstLetterNickname)
        firstLetterNickname.setNextStep(nextStep: fullFormatNickname)
        
        let result = emptyText.check()
        if result.result == true {
            return (true, nil)
        } else {
            return (false, result.error)
        }
    }
}
