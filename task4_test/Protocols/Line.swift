//
//  Line.swift
//  task4_test
//
//  Created by Ap on 26.06.22.
//

import Foundation

protocol Line {
    var nextStep: Line? { get }
    func check() -> (result: Bool, error: ValidationLoginError?)
}
