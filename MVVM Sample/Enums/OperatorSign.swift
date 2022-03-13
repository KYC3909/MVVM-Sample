//
//  OperatorSign.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation

enum OperatorSign: Int {
    case plus = 0, minus, multiply, divider
    
    var description: String {
        switch self {
        case .plus:     return "+"
        case .minus:    return "-"
        case .multiply: return "*"
        case .divider:  return "/"
        }
    }
}

enum SelectedAnswer: Int {
    case notSelected = -1, wrong = 0, correct = 1
}
