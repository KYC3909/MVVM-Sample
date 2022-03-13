//
//  QuizResultsCoordinator.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

final class QuizResultsCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    var parentCoordinator: MathsQuizCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let quizResultsViewController: QuizResultsViewController = .instantiateFromSB(.main)
        let quizResultsViewModel = QuizResultsViewModel()
        quizResultsViewModel.coordinator = self
        quizResultsViewController.quizResultsVM = quizResultsViewModel
        navigationController.pushViewController(quizResultsViewController, animated: true)
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
    
    func popToRootVC() {
        navigationController.popToRootViewController(animated: true)
    }

}
