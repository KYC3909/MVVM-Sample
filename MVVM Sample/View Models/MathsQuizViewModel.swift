//
//  MathsQuizViewModel.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation

final class MathsQuizViewModel {
    let title = "Questions"
    weak var coordinator: MathsQuizCoordinator?
    var onUpdate = {}
    var onTimerUpdate:((_ currentQueNo: String, _ remaningSeconds: String) -> Void)?
    var timer: Timer?
    var currentIndex = 0
    var numberOfSeconds = questionSeconds

    
    private(set) var cells: [Cell] = []

    
    func viewDidLoad() {
        reload()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
    func showQuizResultsScreen() {
        coordinator?.showQuizResultsScreen(cells)
    }
    func showNextQuestion() {
        // Reset with seconds
        numberOfSeconds = questionSeconds
        increaseIndexPointerBy1()
        
        if currentIndexPointer() == cells.count {
            stopTimer()
            showQuizResultsScreen()
            return
        }
        
        // Update Table
        onUpdate()
        startTimer()
        onTimerUpdate?("Que: \(currentIndexPointer() + 1)", numberOfSeconds.description)
    }
}
//MARK: - Create Cell related Methods
extension MathsQuizViewModel {
    func reload() {
        let arrayInt = 0..<numberOfQuestions
        cells = arrayInt.map {_ in
            let arithmetic = Arithmetic()
            arithmetic.shuffleArray()
            let mathsQuizCellViewModel = MathsQuizCellViewModel(arithmetic)
            return .quizCell(mathsQuizCellViewModel)
        }
        onUpdate()
        startTimer()
    }
    
    func numberOfRows() -> Int {
        return 1
    }
    
    func currentIndexPointer() -> Int {
        return currentIndex
    }
    
    func increaseIndexPointerBy1() {
        currentIndex += 1
    }

    func cellAtCurrentIndex() -> Cell {
        return cells[currentIndex]
    }
    
}

//MARK: - Timer Methods
extension MathsQuizViewModel {
    // Stop Timer
    func stopTimer() {
        invalidateTimer()
    }
    
    // Resume Timer
    func resumeTimer(){
        initiateTimer()
    }
    
    // Start Timer
    func startTimer(){
        stopTimer()
        initiateTimer()
    }

    // Invalidate previous timer in order for safety check
    private func invalidateTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    // Initiate Timer
    private func initiateTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCalled(_:)), userInfo: nil, repeats: true)
    }
    
    // Timer Called Function
    @objc func timerCalled(_ timer: Timer) {
        numberOfSeconds -= 1
        if numberOfSeconds <= 0 {
            showNextQuestion()
        }else {
            onTimerUpdate?("Que: \(currentIndexPointer() + 1)", numberOfSeconds.description)
        }
    }
}
