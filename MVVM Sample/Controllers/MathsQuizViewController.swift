//
//  MathsQuizViewController.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

class MathsQuizViewController: UIViewController {
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblQueNo: UILabel!
    @IBOutlet weak var lblTimer: UILabel!


    // MARK: - IVars
    var mathsQuizVM: MathsQuizViewModel!
}

// MARK: - Life Cycle
extension MathsQuizViewController {
    override func viewDidLoad() { super.viewDidLoad()
        setupNavigationView()   // Navigation View
        setTexts()              // Setup Texts
        
        // Table Update
        mathsQuizVM.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        mathsQuizVM.viewDidLoad()
    }
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated)
        mathsQuizVM.viewDidDisappear()
    }
    
}
// MARK: - Setup View
extension MathsQuizViewController {

    // Assign Texts
    private func setTexts() {
        mathsQuizVM.onTimerUpdate = { [weak self] (currentQueNo, seconds) in
            self?.lblQueNo.text = currentQueNo
            self?.lblTimer.text = seconds
        }
    }
    
    // Navigation View
    private func setupNavigationView() {
        navigationItem.title = mathsQuizVM.title
        navigationController?.setToolbarHidden(false, animated: false)
    }
}

// MARK: - UITableView DataSource / Delegate
extension MathsQuizViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mathsQuizVM.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mathsQuizVM.cellAtCurrentIndex() {
        case .quizCell(let mathsQuizCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: QuizCell.id, for: indexPath) as! QuizCell
            cell.update(with: mathsQuizCellViewModel)
            cell.onOptionClicked = { [weak self] in
                self?.mathsQuizVM.showNextQuestion()
            }
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
