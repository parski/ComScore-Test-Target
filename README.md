# Broken ComScore iOS SDK Demonstration

This repository demonstrates how linking the ComScore iOS SDK is fundamentally broken.

This is demonstrated using two Xcode projects.

### ComScore-Test-Target

This is the proper way to link frameworks to a test target. It will not compile the test target.

* Fresh Single View Application with `ComScore.framework` linked to main target.
* Able to use the `SCORAnalytics` class in the main target. See the `ViewController` class.
* Test target doesn't compile due to use of the ComScore framework in `ComScore_Test_TargetTests`.

How to use:

1. Compile main target (`ComScore_Test_Target`). Compilation should succeed.
2. Open `ComScore_Test_TargetTests.swift` and try to compile test target (`ComScore_Test_TargetTests`). Compilation should fail.

### ComScore-Test-Target-Both

This method will compile but does not work if you try to use and ComScore classes in your tests.

* Fresh Single View Application with `ComScore.framework` linked to both targets.
* Exposing the `SCORAnalytics` class as a public property on the `ViewController` class.
* Tests in `ComScore_Test_Target_BothTests` demonstrating why the framework can not be used in the test target when linked directly.

How to use:

1. Clone this repository.
2. Compile main target (`ComScore_Test_Target_Both`).
3. Open `ComScore_Test_Target_BothTests.swift` and try to compile test target (`ComScore_Test_TargetTests`). Compilation succeed.
4. Run tests. `test_differentTargets()` should fail.

### What I mean by broken:

1. The first project (`ComScore_Test_Target`) is broken because compilation fails when trying to use the ComScore class `SCORAnalytics`. It should not fail because we import the main target (more specifically the main bundle) using `@testable`. This attribute exists for testing public or internal entities in a test bundle such as our test target. 
2. The second project (`ComScore_Test_Target_Both`) fails because we compare the class `SCORAnalytics` from our main target with the class `SCORAnalytics` from our test target. This is because each target gets a different set of symbols when each imports the framework and the classes are in fact not equal.

This should be fixed because a lot of (albeit far from enough) developers work using TDD and not being able to properly link a framework to a test target makes this impossible.