//
//  CheckFullFormatNickname.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class CheckFullFormatNickname: Link, Line {
    private let text: String
    private var nextStep: Line?
    
    required init(text: String) {
        self.text = text
    }
    
    func check() -> (result: Bool, error: ValidationLoginError?) {
        if checkFullFormatNickname() {
            if let nextStep = nextStep {
                return nextStep.check()
            }
            return (true,nil)
        } else {
            return (false, ValidationLoginError.invalidNickname)
        }
    }
    
    func checkFullFormatNickname() -> Bool {
        return RulesChainResponsibility.fullFormatNickname.check(text)
    }
    
    func setNextStep(nextStep: Line?) {
        self.nextStep = nextStep
    }
}
