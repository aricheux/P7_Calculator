//
//  Calculator.swift
//  CountOnMe
//
//  Created by RICHEUX Antoine on 22/12/2017.
//  Copyright © 2017 Ambroise Collon. All rights reserved.
//

import Foundation
import UIKit

class Calculator {
    // MARK: - Properties
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    
    // MARK: - Methods
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func checkAndAddOperator(_ newOperator: String) -> Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        
        operators.append(newOperator)
        stringNumbers.append("")
        
        return true
    }
    
    func isExpressionCorrect() -> Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }
    
    func calculateTotal() -> Int {
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                } else if operators[i] == "x" {
                    total *= number
                }
            }
        }
        return total
    }
    
    func enumeratedString() -> EnumeratedSequence<[String]> {
        return stringNumbers.enumerated()
    }

    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    
}
