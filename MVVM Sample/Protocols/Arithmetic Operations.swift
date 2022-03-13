//
//  Arithmetic Operations.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation


protocol ArithmeticOperationProtocol: AnyObject {
    func doOperation(_ first: Int, _ second: Int) -> String
}

protocol GenerateAnswersProtocol: AnyObject {
    func genereteCorrectAnswer()
    func genereteWrongAnswers()
}

