//
//  ValidationNickname.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class ValidationNickname: Link, Branch {
    let text: String
    var emptyText: CheckEmptyText
    var wordLength: CheckWordLength
    var firstLetterNickname: CheckFirstLetterNickname
    var fullFormatNickname: CheckFullFormatNickname
    
    required init(text: String) {
        self.text = text
        emptyText = CheckEmptyText(text: text)
        wordLength = CheckWordLength(text: text)
        firstLetterNickname = CheckFirstLetterNickname(text: text)
        fullFormatNickname = CheckFullFormatNickname(text: text)
    }
    
    func start() -> (result: Bool, error: ValidationLoginError?) {
        emptyText.nextStep = wordLength
        wordLength.nextStep = firstLetterNickname
        firstLetterNickname.nextStep = fullFormatNickname
        
        let result = emptyText.check()
        if result.result == true {
            return (true, nil)
        } else {
            return (false, result.error)
        }
    }
}
