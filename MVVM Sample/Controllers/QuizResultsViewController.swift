//
//  QuizResultsViewController.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

class QuizResultsViewController: UIViewController {
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTotalScore: UILabel!
    
    // MARK: - IVars
    var quizResultsVM: QuizResultsViewModel!
}
// MARK: - Life Cycle
extension QuizResultsViewController {
    override func viewDidLoad() { super.viewDidLoad()
        setTexts()
        
        // Table Update
        quizResultsVM.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        quizResultsVM.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        setupNavigationView()   // Navigation View
    }
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated)
        quizResultsVM.viewDidDisappear()
    }
}
// MARK: - Setup View
extension QuizResultsViewController {

    // Assign Texts
    private func setTexts() {
        navigationItem.title = quizResultsVM.title
        lblTotalScore.text = quizResultsVM.totalScore()
    }
    
    // Navigation View
    private func setupNavigationView() {
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

// MARK: - UITableView DataSource / Delegate
extension QuizResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizResultsVM.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch quizResultsVM.cell(at: indexPath) {
        case .quizCell(let mathsQuizCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: QuizResultsCell.id, for: indexPath) as! QuizResultsCell
            cell.update(with: mathsQuizCellViewModel)
            cell.alpha = 0
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1
        }
    }
}
