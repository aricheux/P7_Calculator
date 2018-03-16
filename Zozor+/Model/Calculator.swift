//
//  Calculator.swift
//  CountOnMe
//
//  Created by RICHEUX Antoine on 22/12/2017.
//  Copyright © 2017 Ambroise Collon. All rights reserved.
//

import Foundation
import UIKit

// Class to handle the calculator
class Calculator {
    /// String who contains all number pressed
    var stringNumbers: [String] = [String()]
    
    /// String who contains all operator pressed
    var operators: [String] = ["+"]
    
    /// Add the new number to the current calcul
    /// - Parameter newNumber: Number pressed from the view
    public func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count - 1] = stringNumberMutable
        }
    }
    
    /// Add a new operator to the current calcul
    /// - Parameter newOperator: Operator pressed from the view
    public func addOperator(_ newOperator: String) {
        operators.append(newOperator)
        stringNumbers.append("")
    }

    /// To add a new operator it is necessary to have a number before
    /// - Returns: return true if it's possible to add the new operator
    public func isExpressionCorrect() -> Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }
    
    /// First check if there are priority calcul
    /// Then calcul the result according to the operator sign
    /// - Returns: return the final calcul
    public func calculateTotal() -> Int {
        checkCalculPriority()
        
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        return total
    }
    
    /// Check if there are an operator needed priority and do the calcul
    private func checkCalculPriority() {
        var i = operators.count - 1
        while i > 0 {
            if operators[i] == "x" {
                if let firstNumber = Int(stringNumbers[i - 1]), let secondNumber = Int(stringNumbers[i]) {
                    stringNumbers[i - 1] = String(firstNumber * secondNumber)
                    stringNumbers.remove(at: i)
                }
                operators.remove(at: i)
            }
            i -= 1
        }
    }

    /// Delete all entries and initialize the operator string
    public func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    
}
