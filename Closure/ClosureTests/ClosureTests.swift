//
//  ClosureTests.swift
//  ClosureTests
//
//  Created on 01/07/15.
//

import UIKit
import XCTest

class ClosureTests: XCTestCase {
    
    let iterable = Iterable(array: [Thing(name: "one", size: nil), Thing(name: "two", size: 2), Thing(name: "three", size: 3)])
    
    override func setUp() {
        super.setUp()
        
         NSLog("%@", iterable.description)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDoesNotCompile() {
        
        var name: String?
        var iterations = 0
        
        //DOES NOT COMPILE
        /*
        iterable.iterate { (someThing) -> Bool in
            iterations++
            if name = someThing.giveNameIfSize() {
                return true
            }
            return false
        }
        */
    }
    
    
    func testPass() {
        
        var name: String?
        var iterations = 0
        
        iterable.iterate { (someThing) -> Bool in
            iterations++
            if var tempResult = someThing.giveNameIfSize() {
                name = tempResult
                return true
            }
            return false
        }
        
        XCTAssert(name != nil, "Could not find some thing with a size")
        XCTAssert(name == "two", "Must have found 'two'")
        XCTAssert(iterations == 2, "Must have gone through only two objects")
    }
    
    func testPassAgain() {
        
        var name: String?
        var iterations = 0
        
        iterable.iterate { (someThing) -> Bool in
            iterations++
            name = someThing.giveNameIfSize()
            if name != nil {
                return true
            }
            return false
        }
        
        XCTAssert(name != nil, "Could not find some thing with a size")
        XCTAssert(name == "two", "Must have found 'two'")
        XCTAssert(iterations == 2, "Must have gone through only two objects")
    }
    
}
