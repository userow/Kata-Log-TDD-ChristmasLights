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

	func testShouldCreateLight() throws {
		let initedLight = Light()
		XCTAssertNotNil(initedLight, "Light not created")
	}

	func testShouldCreateCoordinatePair() throws {
		let coordPair = CoordinatePair(0,0,2,2)
		XCTAssertNotNil(coordPair, "CoordinatePair not created")
	}

	func testShouldCreateLightGrid() throws {
		let initedLightGrid = LightGrid()
		XCTAssertNotNil(initedLightGrid, "LightGrid not created")
	}

	func testShouldTurnOnAllLights() throws {
		//given
		let allCoords = CoordinatePair(0, 0, 999, 999)

		//when
		lightGrid.turnOn(allCoords)

		//then
		continueAfterFailure = false

		lightGrid.process(coord: allCoords) { light in
			XCTAssertEqual(light.isOn(), true, "Light is not on")
		}

	}

	func testShouldToggleFirstRow() throws {

		// given
		let coordOn = CoordinatePair(0, 0, 999, 0)

		// when
		lightGrid.toggle(coordOn)

		// then
		let coordOff = CoordinatePair(0, 1, 999, 999)

		continueAfterFailure = false

		lightGrid.process(coord: coordOn) { light in
			XCTAssertEqual(light.isOn(), true, "Light in first row is not on")
		}

		lightGrid.process(coord: coordOff) { light in
			XCTAssertEqual(light.isOn(), false, "Light in NOT first row is not off")
		}
	}

	func testShouldTurnOffFourLightsInTheMiddle() throws {
		// given
		let allCoords = CoordinatePair(0, 0, 999, 999)
		let fourInCenterCoords = CoordinatePair(499,499,500,500)

		// when
		lightGrid.turnOn(allCoords)
		lightGrid.turnOff(fourInCenterCoords)

		// then
		let topPartCoords = CoordinatePair(0, 0, 999, 498)
		let leftBottomCoords = CoordinatePair(0, 499, 498, 999)
		let centerBottomCoords = CoordinatePair(499, 501, 500, 999)
		let rightBottomCoords = CoordinatePair(501, 499, 999, 999)

		continueAfterFailure = false

		lightGrid.process(coord: fourInCenterCoords) { light in
			XCTAssertEqual(light.isOn(), false, "Light in middle four is not off")
		}

		lightGrid.process(coord: topPartCoords) { light in
			XCTAssertEqual(light.isOn(), true, "Light in topPartCoords is not on")
		}

		lightGrid.process(coord: leftBottomCoords) { light in
			XCTAssertEqual(light.isOn(), true, "Light in leftBottomCoords is not on")
		}

		lightGrid.process(coord: centerBottomCoords) { light in
			XCTAssertEqual(light.isOn(), true, "Light in centerBottomCoords is not on")
		}

		lightGrid.process(coord: rightBottomCoords) { light in
			XCTAssertEqual(light.isOn(), true, "Light in rightBottomCoords is not on")
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
