//
//  Branch.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

protocol Branch {
    func start() -> (result: Bool, error: ValidationLoginError?)
}
