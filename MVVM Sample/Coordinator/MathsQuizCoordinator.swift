//
//  MathsQuizCoordinator.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

final class MathsQuizCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    var parentCoordinator: HomeCoordinator?

    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mathsQuizViewController: MathsQuizViewController = .instantiateFromSB(.main)
        let mathsQuizViewModel = MathsQuizViewModel()
        mathsQuizViewModel.coordinator = self
        mathsQuizViewController.mathsQuizVM = mathsQuizViewModel
        navigationController.pushViewController(mathsQuizViewController, animated: true)
    }
    
    func showQuizResultsScreen() {
        let quizResultsCoordinator = QuizResultsCoordinator(navigationController: navigationController)
        quizResultsCoordinator.parentCoordinator = self
        childCoordinators.append(quizResultsCoordinator)
        quizResultsCoordinator.start()
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}


