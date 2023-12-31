//
//  IfTests.swift
//  jsonlogicTests
//
//  Created by Christos Koninis on 11/02/2019.
//

import XCTest
@testable import jsonlogic

class InTests: XCTestCase {

    func testIn_StringArgument() {
        var rule =
        """
        { "in" : ["Spring", "Springfield"] }
        """
        XCTAssertEqual(true, try applyRule(rule, to: nil))

        rule =
        """
        {"in":["Spring","Springfield"]}
        """
        XCTAssertEqual(true, try applyRule(rule, to: nil))

        rule =
        """
        {"in":["i","team"]}
        """
        XCTAssertEqual(false, try applyRule(rule, to: nil))
    }

    func testIn_ArrayArgument() {
        var rule =
        """
        {"in":["Bart",["Bart","Homer","Lisa","Marge","Maggie"]]}
        """
        XCTAssertEqual(true, try applyRule(rule, to: nil))

        rule =
        """
        {"in":["Milhouse",["Bart","Homer","Lisa","Marge","Maggie"]]}
        """
        XCTAssertEqual(false, try applyRule(rule, to: nil))
    }
    
    func testIn_IntegerArgument() {
        var rule =
        """
        {"in":[5,[-1,0,1,2,3,4,5]]}
        """
        XCTAssertEqual(true, try applyRule(rule, to: nil))

        rule =
        """
        {"in":[5,[-0,0,1,2,3,4,6]]}
        """
        XCTAssertEqual(false, try applyRule(rule, to: nil))
    }
    
    func testIn_DoubleArgument() {
        var rule =
        """
        {"in":[5.1,[1.2,2.5,3.5,4.333,5.1]]}
        """
        XCTAssertEqual(true, try applyRule(rule, to: nil))

        rule =
        """
        {"in":[5.1,[1.2,2,2.5,3.5,4.333,5]]}
        """
        XCTAssertEqual(false, try applyRule(rule, to: nil))
    }

    func testIn_BoolArgument() {
        var rule =
        """
        {"in":[true,[false, true, false]]}
        """
        XCTAssertEqual(true, try applyRule(rule, to: nil))

        rule =
        """
        {"in":[true,[false, false, false]]}
        """
        XCTAssertEqual(false, try applyRule(rule, to: nil))
    }
}
