//
//  QuizCell.swift
//  MVVM Sample
//
//  Created by Krunal on 13/3/22.
//

import UIKit

final class QuizCell: UITableViewCell {
    // MARK: - IVars
    static let id = "QuizCell"



    // MARK: - @IBOutlet Properties
    @IBOutlet weak var lblFirstArg: UILabel!
    @IBOutlet weak var lblOperator: UILabel!
    @IBOutlet weak var lblSecondArg: UILabel!

    @IBOutlet weak var btnAns1: UIButton!
    @IBOutlet weak var btnAns2: UIButton!
    @IBOutlet weak var btnAns3: UIButton!
    @IBOutlet weak var btnAns4: UIButton!

    
    override func awakeFromNib() { super.awakeFromNib()
    }

    func update(with viewModel: MathsQuizCellViewModel) {
       let btnArray = [btnAns1, btnAns2, btnAns3, btnAns4]
        let ansArray = viewModel.getAnsArray()
        btnArray.enumerated().forEach {
            $0.element?.setTitle(ansArray[$0.offset], for: .normal)
        }

        lblFirstArg.text = viewModel.firstNumber
        lblSecondArg.text = viewModel.secondNumber
        lblOperator.text = viewModel.operatorDescription
    }
}

// MARK: - IBAction
extension QuizCell {
    @IBAction func btnOptionSelected(_ sender: UIButton) {
                
        switch sender.tag {
        case 100:
            break
        case 101:
            break
        case 102:
            break
        case 103:
            break
        
        
        default: break
        }
    }
}
