# Broken ComScore iOS SDK Demonstration

This repository demonstrates how linking the ComScore iOS SDK is fundamentally broken.

This is demonstrated using:

1. Fresh Single View Application with `ComScore.framework` linked.
2. Exposing the `SCORAnalytics` class as a public property on the `ViewController` class.
3. Two examples in `ComScore_Test_TargetTests`.

How to use:

1. Clone this repository.
2. Compile main target (`ComScore_Test_Target`). The name is unclear but it should compile.
3. Open `ComScore_Test_TargetTests.swift` and try to compile test target (`ComScore_Test_TargetTests`). Compilation should fail.
4. Uncomment line 36, 51-54, 63-65.
5. Compile test target again. It should succeed.
6. Run tests. `test_secondExample()` should fail.

As I've written in the comments in the test file this is because each target gets a different set of symbols when each imports the framework and the classes are in fact not equal.

This should be fixed because a lot of (albeit far from enough) developers work using TDD and not being able to properly link a framework to a test target makes this impossible.