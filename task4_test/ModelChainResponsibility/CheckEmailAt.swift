//
//  CheckEmailAt.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

class CheckEmailAt: Link, BranchingEmailOrNickname {
    private let text: String
    
    required init(text: String) {
        self.text = text
    }
    
    func check() -> Bool {
        return !text.contains("@")
    }
}
