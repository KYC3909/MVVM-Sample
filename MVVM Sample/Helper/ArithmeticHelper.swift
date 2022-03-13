//
//  ArithmeticHelper.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation

func random(_ lowerBound: Int, _ upperBound: Int) -> Int {
    let randomInt = Int.random(in: lowerBound...upperBound)
    return randomInt
}


extension Double {
    // Return Double Value but with Specific Decimal Placed value
    func rounded(of n: Int) -> String {
        let multiplier = pow(10, Double(n))
        let x = ((multiplier * self).advanced(by: -0.01)).rounded()/multiplier
        let y = (x == -0.0) ? 0 : x
        return y.description
    }
}
