//
//  QuizResultsViewModel.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation

final class QuizResultsViewModel {
    
    weak var coordinator: QuizResultsCoordinator?
    
    
    func popToRootVC() {
        coordinator?.popToRootVC()
    }
}
