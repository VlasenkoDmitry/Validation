//
//  CheckWordLength.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class CheckWordLength: Link, Line {
    var text: String
    
    required init(text: String) {
        self.text = text
    }
    
    func check() -> (result: Bool, error: ValidationLoginError?) {
        if checkWordLength() {
            if let nextStep = nextStep {
                return nextStep.check()
            }
            return (true,nil)
        } else {
            return (false, ValidationLoginError.incorrectLengthLogin)
        }
    }
    
    var nextStep: Line?
    
    func checkWordLength() -> Bool {
        return RulesChainResponsibility.wordLength.check(text)
    }
}
