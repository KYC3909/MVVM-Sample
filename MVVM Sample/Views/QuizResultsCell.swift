//
//  QuizResultsCell.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

final class QuizResultsCell: UITableViewCell {
    // MARK: - IVars
    static let id = "QuizResultsCell"
    weak var viewModel: MathsQuizCellViewModel?

    // MARK: - @IBOutlet Properties
    @IBOutlet weak var lblQue: UILabel!
    @IBOutlet weak var lblAns: UILabel!
    @IBOutlet weak var lblCorrectWrong: UILabel!

    
    override func awakeFromNib() { super.awakeFromNib()
    }
    
    func update(with viewModel: MathsQuizCellViewModel) {
        self.viewModel = viewModel
        
        lblQue.text = viewModel.question
        lblAns.text = viewModel.correctAns
        lblCorrectWrong.text = viewModel.wasAnsCorrect
    }
}
