//
//  HomeViewModel.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation

final class HomeViewModel {
    
    // Coordinator Reference for Navigating to Next Screen
    weak var coordinator: HomeCoordinator?
    
    let title = "Maths\nQuiz"
    let startBtnTitle = "Start"

    // Start Maths Quiz Btn Pressed
    func tappedStartMathsQuiz() {
        coordinator?.startMathsQuiz()
    }
}
