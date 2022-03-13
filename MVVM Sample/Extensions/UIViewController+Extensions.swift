//
//  UIViewController+Extensions.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

extension UIViewController {
    
    static func instantiateFromSB<T>(_ sb: StoryBoard) -> T {
        let storyboard = sb.get()
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}

