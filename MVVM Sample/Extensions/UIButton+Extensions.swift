//
//  UIButton+Extensions.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation
import UIKit


public extension UIButton {
    
    func makeHalfRound() {
        backgroundColor = .clear
        layer.cornerRadius = self.bounds.height * 0.5
    }
    
    func makeBorder() {
        layer.borderWidth = borderWidth
        layer.borderColor = self.titleLabel!.textColor.cgColor
    }
}
