//
//  QuizResultsViewModel.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import Foundation

final class QuizResultsViewModel {
    let title = "Result"
    weak var coordinator: QuizResultsCoordinator?
    var onUpdate = {}

    private(set) var results: [Arithmetic] = []
    private(set) var cells: [Cell] = []

    init(with results: [Arithmetic]) {
        self.results = results
    }
    
    func viewDidLoad() {
        reload()
    }
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
    func popToRootVC() {
        coordinator?.popToRootVC()
    }
    func totalScore() -> String {
        let total = results.reduce(0) { (result, item) -> Int in
            if (item.ansSelected.rawValue == 1) {
                return result + 1
            }
            return result
        }
        return "\(total) / \(results.count)"
    }
}

//MARK: - Create Cell related Methods
extension QuizResultsViewModel {
    func reload() {
        cells = results.map { obj in
            let mathsQuizCellViewModel = MathsQuizCellViewModel(obj)
            return .quizCell(mathsQuizCellViewModel)
        }
        onUpdate()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
}
