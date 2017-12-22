//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    let calculator = Calculator()

    // MARK: - Action
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculator.addNewNumber(i)
                updateDisplay()
            }
        }
    }

    @IBAction func plus() {
        if calculator.canAddOperator {
        	calculator.operators.append("+")
        	calculator.stringNumbers.append("")
            updateDisplay()
        } else {
            incorrectExpression()
        }
    }

    @IBAction func minus() {
        if calculator.canAddOperator {
            calculator.operators.append("-")
            calculator.stringNumbers.append("")
            updateDisplay()
        } else {
            incorrectExpression()
        }
    }
    
    func incorrectExpression() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    @IBAction func equal() {
        if isExpressionCorrect(){
            let total = calculator.calculateTotal()
            textView.text = textView.text + "=\(total)"
            calculator.clear()
        }
    }
    
    func isExpressionCorrect() -> Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                } else {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }

    func updateDisplay() {
        var text = ""
        for (i, calculator.stringNumbers) in calculator.stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += calculator.operators[i]
            }
            // Add number
            text += calculator.stringNumber
        }
        textView.text = text
    }

}