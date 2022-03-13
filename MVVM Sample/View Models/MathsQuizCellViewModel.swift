//
//  MathsQuizCellViewModel.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation

struct MathsQuizCellViewModel {
    private let arithmeticObj: Arithmetic

    init(_ arithmeticObj: Arithmetic) {
        self.arithmeticObj = arithmeticObj
    }
    
    func getAnsArray() -> [String] {
        return arithmeticObj.answersArray
    }
    
    var firstNumber: String {
        return arithmeticObj.firstArg.description
    }
    
    var secondNumber: String {
        return arithmeticObj.secondArg.description
    }
    
    var operatorDescription: String {
        return OperatorSign(rawValue: arithmeticObj.selOperator)!.description
    }

}
