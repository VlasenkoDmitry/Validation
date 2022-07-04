//
//  CheckFirstLetterNickname.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class CheckFirstLetterNickname: Link, Line {
    private let text: String
    private var nextStep: Line?
    
    required init(text: String) {
        self.text = text
    }
    
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
    
    func setNextStep(nextStep: Line?) {
        self.nextStep = nextStep
    }
}
