//
//  ComScore_Test_Target_BothTests.swift
//  ComScore-Test-Target-BothTests
//
//  Created by Pär Strindevall on 2017-05-26.
//  Copyright © 2017 Pär Strindevall. All rights reserved.
//

import ComScore
import XCTest
@testable import ComScore_Test_Target_Both

class ComScore_Test_Target_BothTests: XCTestCase {
    
    func test_sameTarget() {
        
        /*
         
         Asserting equality between two references to a ComScore class within the same target is completely fine:
         
         */
        
        let testTargetScorAnalyticsClass = SCORAnalytics.self
        let anotherTestTargetScorAnalyticsClass = SCORAnalytics.self
        
        XCTAssertTrue(testTargetScorAnalyticsClass == anotherTestTargetScorAnalyticsClass)
    }
    
    func test_differentTargets() {
        
        /*
         
         But asserting equality of the same class in another target fails.
         This is because each target gets a different set of symbols when each imports the framework and the classes are in fact not equal.
         
         */
        
        let testTargetScorAnalyticsClass = SCORAnalytics.self
        let mainTargetScorAnalyticsClass = ViewController(nibName: nil, bundle: nil).scorAnalyticsClass
        
        XCTAssertTrue(testTargetScorAnalyticsClass == mainTargetScorAnalyticsClass)
    }
    
}
