//
//  ChristmasLightsTests.swift
//  ChristmasLightsTests
//
//  Created by Pavlo Vasylenko on 01.06.2023.
//

import XCTest
@testable import ChristmasLights

final class ChristmasLightsTests: XCTestCase {

	var lightGrid = LightGrid()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		lightGrid = LightGrid()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		continueAfterFailure = true
    }

	func testShouldCreateLightGrid() throws {
		let initedLightGrid = LightGrid()
		XCTAssertNotNil(initedLightGrid, "LightGrid not created")
	}

	func testShouldCreateCoordinatePair() throws {
		let coordPair = CoordinatePair(0,0,2,2)
		XCTAssertNotNil(coordPair, "CoordinatePair not created")
	}

	func testShouldCreateLight() throws {
		let initedLight = Light()
		XCTAssertNotNil(initedLight, "Light not created")
	}

	func testShouldTurnOnAllLights() throws {
		let lightGrid = LightGrid()
		lightGrid.turnOn(CoordinatePair(0, 0, 10, 10))

		continueAfterFailure = false

		for row in 0...10 { //999
			for col in 0...10 { //999
				XCTAssert(lightGrid.getLight(row: row, col: col).isOn(), "Light is not on")
			}
		}
	}

	func testShouldToggleFirstRow() throws {
		let coord = CoordinatePair(0, 0, 0, 10)

		lightGrid.toggle(coord)

		continueAfterFailure = false

		for row in 0...10 { //999
			for col in 0...10 { //999
				let light = lightGrid.getLight(row: row, col: col)
				dump(light)

				if row == 0 {
					XCTAssert(lightGrid.getLight(row: row, col: col).isOn(), "Light in first row is not on")
				} else {
					XCTAssert(lightGrid.getLight(row: row, col: col).isOn() == false, "Light in NOT first row is not off")
				}
			}
		}

	}

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
