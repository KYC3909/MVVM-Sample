//
//  HomeViewController.swift
//  MVVM Sample
//
//  Created by Krunal on 11/03/22.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    

    // MARK: - IVars
    var homeVM: HomeViewModel!
}

// MARK: - Life Cycle
extension HomeViewController {
    override func viewDidLoad() { super.viewDidLoad()
        setTexts()          // Assign Texts
        setupViews()        // UI Related changes
        setupNavigationView()   // Navigation View
    }
}
// MARK: - Setup View
extension HomeViewController {
    
    // Assign Texts
    private func setTexts() {
        lblTitle.text = homeVM.title
        btnStart.setTitle(homeVM.startBtnTitle, for: .normal)
    }
    
    // UI Related changes
    private func setupViews(){
        lblTitle.textColor = .primary
        btnStart.titleLabel?.textColor = .tint
        
        btnStart.makeHalfRound()
        btnStart.makeBorder()
    }
    
    // Navigation View
    private func setupNavigationView() {
        navigationController?.setToolbarHidden(true, animated: false)
    }
}

// MARK: - IBActions
extension HomeViewController {
    @IBAction func btnStartSelected(_ sender: UIButton) {
        homeVM.tappedStartMathsQuiz()
    }
}
