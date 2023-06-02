//
//  LightGrid.swift
//  ChristmasLights
//
//  Created by Pavlo Vasylenko on 01.06.2023.
//

import Foundation

typealias ProcessLight = (Light) -> Void

class LightGrid {

//	//second option for storage - WORKS
//	var lights: [[Light]]
//
//	init() {
//		lights = [[Light]]()
//		for row in 0...999 {
//			lights.append([Light]())
//			for _ in 0...999 {
//				lights[row].append(Light())
//			}
//		}
//	}

//	//!!! NOT Working - 1 instance linked to all cells of array
	var lights: [[Light]] = Array(repeating: Array(repeating: Light(), count: 1_000), count: 1_000)

		/*
		 Test Case '-[ChristmasLightsTests.ChristmasLightsTests testShouldToggleFirstRow]' started.

		 LightGrid toggle - coord: CoordinatePair(leftTopRow: 0, leftTopCol: 0, rightBottomRow: 0, rightBottomCol: 10)

		 processLight - row - 0, col = 0
		 processLight - pre Process - ChristmasLights.Light - 0x00006000030c9040 🤣
		 ▿ ChristmasLights.Light #0
		   - on: false
		 processLight - after Process - ChristmasLights.Light - 0x00006000030c9040 🤣
		 ▿ ChristmasLights.Light #0
		   - on: true

		 processLight - row - 0, col = 1
		 processLight - pre Process - ChristmasLights.Light - 0x00006000030c9040 🤣
		 ▿ ChristmasLights.Light #0
		   - on: true
		 processLight - after Process - ChristmasLights.Light - 0x00006000030c9040 🤣
		 ▿ ChristmasLights.Light #0
		   - on: false
		 */

	func getLight(row: Int, col: Int) -> Light {
		return lights[row][col]
	}

	func process(coord: CoordinatePair, processLight: ProcessLight) {
		for row in coord.leftTopRow...coord.rightBottomRow {
			for col in coord.leftTopCol...coord.rightBottomCol {
//				print("\nprocessLight - row - \(row), col = \(col)")
				let light = getLight(row: row, col: col)
//				print("processLight - pre Process - \(light) - \(String.pointer(light))")
//				dump(light)
				processLight(light)
//				print("processLight - after Process - \(light) - \(String.pointer(light))")
//				dump(light)
			}
		}
	}

	func turnOn(_ coord: CoordinatePair) {
		print("\nLightGrid turnOn - coord: \(coord)")
		process(coord: coord) { light in
			light.turnOn()
		}
	}

	func turnOff(_ coord: CoordinatePair) {
		print("\nLightGrid turnOff - coord: \(coord)")
		process(coord: coord) { light in
			light.turnOff()
		}
	}

	func toggle(_ coord: CoordinatePair) {
		print("\nLightGrid toggle - coord: \(coord)")
		process(coord: coord) { light in
			light.toggle()
		}
	}
}
