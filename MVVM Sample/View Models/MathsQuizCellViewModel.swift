//
//  MathsQuizCellViewModel.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation

class MathsQuizCellViewModel {
    let arithmeticObj: Arithmetic

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
    
    func pickedAnswer(_ ans: String) {
        if ans == "--" { return }
        arithmeticObj.pickedAnswer(ans)
    }
    
    
    var question: String {
        return "\(firstNumber)  \(operatorDescription)  \(secondNumber)  = "
    }
    
    var correctAns: String {
        return arithmeticObj.corrctAnswer
    }
    
    var wasAnsCorrect: String {
        return arithmeticObj.ansSelected.description
    }

}
