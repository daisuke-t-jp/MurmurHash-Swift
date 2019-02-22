import XCTest

import MurmurHashTests

var tests = [XCTestCaseEntry]()
tests += MurmurHashTests.allTests()
XCTMain(tests)
