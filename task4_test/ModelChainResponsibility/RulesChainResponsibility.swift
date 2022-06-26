//
//  RulesSecond.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

struct RulesChainResponsibility {
    
    let check: (String) -> Bool
    
    static let isEmpty = RulesChainResponsibility(check: {
        return $0.isEmpty ? true : false
    })
    
    static let wordLength = RulesChainResponsibility(check: {
        return $0.count >= 3 && $0.count <= 32 ? true : false
    })
    
    static let validEmail = RulesChainResponsibility(check: {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.([A-Za-z]){2,3}").evaluate(with: $0) ? true : false
    })

    static let firstLetterNickname = RulesChainResponsibility(check: {
        return NSPredicate(format: "SELF MATCHES %@", "[0-9-.]").evaluate(with: String(Array($0)[0])) ? true : false
    })
    
    static let fullFormatNickname = RulesChainResponsibility(check: {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z-.]{1,}").evaluate(with: $0) ? true : false
    })
}
