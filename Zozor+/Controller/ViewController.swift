//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import Foundation
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
        if calculator.checkAndAddOperator("+") {
            updateDisplay()
        } else {
            incorrectExpression()
        }
    }

    @IBAction func minus() {
        if calculator.checkAndAddOperator("-") {
            updateDisplay()
        } else {
            incorrectExpression()
        }
    }
    
    @IBAction func multply() {
        if calculator.checkAndAddOperator("x") {
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
        if calculator.isExpressionCorrect(){
            let total = calculator.calculateTotal()
            textView.text = textView.text + "=\(total)"
            calculator.clear()
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func clear() {
        calculator.clear()
        updateDisplay()
    }

    func updateDisplay() {
        var text = ""
        for (i, stringNumber) in calculator.enumeratedString() {
            // Add operator
            if i > 0 {
                text += calculator.operators[i]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }

}
