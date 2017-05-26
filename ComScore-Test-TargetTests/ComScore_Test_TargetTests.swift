//
//  ComScore_Test_TargetTests.swift
//  ComScore-Test-TargetTests
//
//  Created by Pär Strindevall on 2017-05-26.
//  Copyright © 2017 Pär Strindevall. All rights reserved.
//

import ComScore
import XCTest
@testable import ComScore_Test_Target

class ComScore_Test_TargetTests: XCTestCase {
    
    func test_firstExample() {
        
        /* Problem illustration:
         
         Test target does not compile even though ComScore is a member of the parent target and imported using the @testable attribute.
                  
        */
        
        _ = SCORAnalytics()
    }

}
