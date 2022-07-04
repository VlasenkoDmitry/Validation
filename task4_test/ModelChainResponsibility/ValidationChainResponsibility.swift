//
//  ValidationChainResponsibility.swift
//  task4_test
//
//  Created by Ap on 24.06.22.
//

import Foundation

class ValidationChainResponsibility: Link, Branch {
    private let text: String
    
    required init(text: String) {
        self.text = text
    }
    
    func start() -> (result: Bool, error: ValidationLoginError?) {
        let checkEmail = CheckEmailAt(text: text)
        var validation: Branch
        if checkEmail.check() {
            validation = ValidationNickname(text: text)
        } else {
            validation = ValidationEmail(text: text)
        }
        return validation.start()
    }
}
