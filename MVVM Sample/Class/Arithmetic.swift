//
//  Arithmetic.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation

class Arithmetic: ArithmeticOperationProtocol, GenerateAnswersProtocol {
    
    let firstArg: Int = random(0, 9)
    let secondArg: Int = random(1, 9)
    let selOperator: Int = random(0, 3)
    
    var answersArray = [String]()
    var corrctAnswer : String = ""
    var ansSelected = SelectedAnswer.notSelected
    
    func doOperation(_ first: Int, _ second: Int) -> String {
        switch selOperator {
        case OperatorSign.plus.rawValue:
            return (first + second).description
            
        case OperatorSign.minus.rawValue:
            return (first - second).description
        
        case OperatorSign.multiply.rawValue:
            return (first * second).description
            
        case OperatorSign.divider.rawValue:
            return (Double(first) / Double(second)).rounded(of: 3)
        
        default: break
        }
        return ""
    }
    
    func genereteCorrectAnswer() {
        corrctAnswer = doOperation(firstArg, secondArg)
        answersArray.append(corrctAnswer)
    }
    
    func genereteWrongAnswers() {
        if answersArray.count < 4 {
            let ans = doOperation(random(0, 9), random(1, 9))
            if ans != corrctAnswer {
                answersArray.append(ans)
            }
            genereteWrongAnswers()
        }
    }
    
    func shuffleArray() {
        genereteCorrectAnswer()
        genereteWrongAnswers()
        answersArray = answersArray.shuffled()
    }
    
    func pickedAnswer(_ ans: String) {
        ansSelected = (ans == corrctAnswer) ? .correct : .wrong
    }
}
