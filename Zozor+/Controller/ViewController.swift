//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import Foundation
import UIKit

/// Class to handle the main view
class ViewController: UIViewController {
    /// a text view who contains all calcul
    @IBOutlet weak var textView: UITextView!
    
    /// a uibutton collection's who contains all number of the calculator
    @IBOutlet var numberButtons: [UIButton]!
    
    /// Create a calculator
    let calculator = Calculator()

    
    /// Add the number to the current calcul when it's pressed
    /// Update the text view
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculator.addNewNumber(i)
                updateDisplay()
            }
        }
    }

    /// Check if possible and add a plus operator when it's pressed
    @IBAction func plus() {
        if calculator.isExpressionCorrect() {
            calculator.addOperator("+")
            updateDisplay()
        } else {
            incorrectExpression()
        }
    }

    /// Check if possible and add a minus operator when it's pressed
    @IBAction func minus() {
        if calculator.isExpressionCorrect() {
            calculator.addOperator("-")
            updateDisplay()
        } else {
            incorrectExpression()
        }
    }
    
    /// Check if possible and add a multiply operator when it's pressed
    @IBAction func multiply() {
        if calculator.isExpressionCorrect() {
            calculator.addOperator("x")
            updateDisplay()
        } else {
            incorrectExpression()
        }
    }
    
    /// Show an error message if there are an incorrect expression
    func incorrectExpression() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    /// Calculate the total when the equal button is pressed
    /// Show an error message if there are an incorrect expression
    @IBAction func equal() {
        if calculator.isExpressionCorrect() {
            let total = calculator.calculateTotal()
            textView.text = textView.text + "=\(total)"
            calculator.clear()
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    /// Reset the current calcul and update the text view
    @IBAction func clear() {
        calculator.clear()
        updateDisplay()
    }

    /// Update the text view with new number and new operator
    func updateDisplay() {
        var text = ""
        for (i, stringNumber) in calculator.stringNumbers.enumerated() {
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
