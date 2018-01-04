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
    
    func testGivenNumberIsEmpty_WhenAddOperator_ReturnFalse() {
        addString("")
        XCTAssert(calculator.canAddOperator == false)
    }
    
    func testGivenNumberiIsPresent_WhenAddOperator_ReturnTrue() {
        addString("32")
        XCTAssert(calculator.canAddOperator == true)
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
    
    func testGivenCalculRequest_WhenEqualIsPush_StringContainCalculationTotal() {
        addString("3")
        calculator.operators.append("x")
        calculator.stringNumbers.append("")
        addString("4")
        XCTAssert(calculator.calculateTotal() == 12)
    }
    
    func testGivenClearCalcul_WhenCalculIsEnded_StringIsEmpty(){
        calculator.clear()
        XCTAssert(calculator.stringNumbers == [""])
    }
}
