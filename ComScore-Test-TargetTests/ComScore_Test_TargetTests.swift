//
//  ComScore_Test_TargetTests.swift
//  ComScore-Test-TargetTests
//
//  Created by Pär Strindevall on 2017-05-26.
//  Copyright © 2017 Pär Strindevall. All rights reserved.
//

import XCTest

@testable import ComScore_Test_Target

class ComScore_Test_TargetTests: XCTestCase {
    
    func test_firstExamble() {
        
        /* Problem illustration:
         
         Line 11:
         @testable import ComScore_Test_Target
         
         Should give this target access to frameworks linked to the test target.
         
         Error: Use of unresolved identifier 'SCORAnalytics'
         
         Try it yourself by comparing Shift + Command + R (build main target) and Shift + Command + U (build test target).
         
         The main target builds just fine but the test target gets a compilation error.
         
        */
        _ = SCORAnalytics()
    }

}

//import ComScore

class ComScore_Test_TargetTestsSecondExample: XCTestCase {
    
    func test_secondExample() {
        
        /* Problem illustration:
         
         Uncomment line 36, 51-54, 63-65.
         
         This import a separate copy of the ComScore framework to the test target.
         This means that asserting equality between two references to a ComScore class within the same target is completely fine:
         
         */
        
//        let testTargetScorAnalyticsClass = SCORAnalytics.self
//        let anotherTestTargetScorAnalyticsClass = SCORAnalytics.self
//        
//        XCTAssertTrue(testTargetScorAnalyticsClass == anotherTestTargetScorAnalyticsClass)
        
        /*
         
         But asserting equality of the same class in another target fails. 
         This is because each target gets a different set of symbols when each imports the framework and the classes are in fact not equal.
         
         */
        
//        let mainTargetScorAnalyticsClass = ViewController(nibName: nil, bundle: nil).scorAnalyticsClass
//        
//        XCTAssertTrue(testTargetScorAnalyticsClass == mainTargetScorAnalyticsClass)
    }
    
}
