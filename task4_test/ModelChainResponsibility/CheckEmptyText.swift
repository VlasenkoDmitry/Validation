//
//  CheckEmptyText.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class CheckEmptyText: Link, Line {
    var text: String
    
    required init(text: String) {
        self.text = text
    }
    
    func check() -> (result: Bool, error: ValidationLoginError?) {
        if checkEmptyText() {
            return (false, ValidationLoginError.incorrectLengthLogin)
        } else {
            if let nextStep = nextStep {
                return nextStep.check()
            }
            return (true,nil)
        }
    }
    
    var nextStep: Line?
    
    func checkEmptyText() -> Bool {
        return RulesChainResponsibility.isEmpty.check(text)
    }
}
