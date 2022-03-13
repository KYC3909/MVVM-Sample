//
//  QuizResultsViewController.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

class QuizResultsViewController: UIViewController {

    var quizResultsVM: QuizResultsViewModel!
    
    override func viewDidLoad() { super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}
// MARK: - IBActions
extension QuizResultsViewController {
    @IBAction func btnDoneSelected(_ sender: UIButton) {
        quizResultsVM.popToRootVC()
    }
}
