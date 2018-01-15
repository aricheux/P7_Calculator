//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by RICHEUX Antoine on 29/12/2017.
//  Copyright © 2017 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorTestCase: XCTestCase {
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    func addString(_ newString: String){
        calculator.stringNumbers[calculator.stringNumbers.count-1] += newString
    }
    
    func addCalcul(_ firstNumber: Int, _ operat: String, _ secondNumber: Int){
        addString(String(firstNumber))
        if calculator.checkAndAddOperator(operat) {
            addString(String(secondNumber))
        }
    }
    
    func testGivenNumberIsEmpty_WhenAddOperator_ReturnFalse() {
        addString("")
        XCTAssert(calculator.checkAndAddOperator("+") == false)
    }
    
    func testGivenNumberiIsPresent_WhenAddOperator_ReturnTrue() {
        addString("32")
        XCTAssert(calculator.checkAndAddOperator("+") == true)
    }
    
    func testGivenNewNumberIsPush_WhenNumberIsAddToString_StringContainNewNumberAtTheEndd() {
        addString("3")
        let initialString = calculator.stringNumbers[calculator.stringNumbers.count-1]
        let newNumber = 2
        calculator.addNewNumber(newNumber)
        let lastCharac = calculator.stringNumbers[calculator.stringNumbers.count-1].last!
        
        XCTAssert(calculator.stringNumbers[calculator.stringNumbers.count-1] != initialString)
        XCTAssert(String(lastCharac) == String(newNumber))
    }
    
    func testGivenMinus_WhenEqualIsPush_StringContainCalculationTotal() {
        addCalcul(3,"-",4)
        XCTAssert(calculator.calculateTotal() == -1)
    }
    
    func testGivenMultply_WhenEqualIsPush_StringContainCalculationTotal() {
        addCalcul(3,"x",4)
        XCTAssert(calculator.calculateTotal() == 12)
    }
    
    func testGivenPlus_WhenEqualIsPush_StringContainCalculationTotal() {
        addCalcul(3,"+",4)
        XCTAssert(calculator.calculateTotal() == 7)
    }
    
    func testGivenMultipleCalcul_WhenEqualIsPush_StringContainCalculationTotal() {
        addCalcul(3,"-",4)
        if calculator.checkAndAddOperator("x") {
            addCalcul(3,"+",4)
            if calculator.checkAndAddOperator("x") {
                addCalcul(3,"+",4)
            }
        }
        
        XCTAssert(calculator.calculateTotal() == 7)
    }
    
    func testGivenClearCalcul_WhenCalculIsEnded_StringIsEmpty(){
        calculator.clear()
        XCTAssert(calculator.stringNumbers == [""])
    }
}
