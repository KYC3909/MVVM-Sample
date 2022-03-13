//
//  StoryBoard.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

enum StoryBoard: String {
    case main = "Main", storyBoard = "Storyboard"
    
    func get() -> UIStoryboard{
        return UIStoryboard(name: self.rawValue, bundle: .main)
    }
}
