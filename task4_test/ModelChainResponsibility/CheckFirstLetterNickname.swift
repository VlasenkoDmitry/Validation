//
//  CheckFirstLetterNickname.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class CheckFirstLetterNickname: Link, Line {
    var text: String
    
    required init(text: String) {
        self.text = text
    }
    
    var nextStep: Line?
    
    func check() -> (result: Bool, error: ValidationLoginError?) {
        if checkFirstLetterNickname() {
            return (false, ValidationLoginError.invalidFirstLetterNickname)
        } else {
            if let nextStep = nextStep {
                return nextStep.check()
            }
            return (true, nil)
        }
    }
    func checkFirstLetterNickname() -> Bool {
        return RulesChainResponsibility.firstLetterNickname.check(text)
    }
    
}
