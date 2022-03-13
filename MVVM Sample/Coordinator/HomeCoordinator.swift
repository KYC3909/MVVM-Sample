//
//  HomeCoordinator.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController: HomeViewController = .instantiateFromSB(.main)
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinator = self
        homeViewController.homeVM = homeViewModel
        navigationController.setViewControllers([homeViewController], animated: false)
    }
    
    func startMathsQuiz() {
        let mathsQuizCoordinator = MathsQuizCoordinator(navigationController: navigationController)
        mathsQuizCoordinator.parentCoordinator = self
        childCoordinators.append(mathsQuizCoordinator)
        mathsQuizCoordinator.start()
    }
        
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
