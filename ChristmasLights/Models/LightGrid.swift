//
//  LightGrid.swift
//  ChristmasLights
//
//  Created by Pavlo Vasylenko on 01.06.2023.
//

import Foundation

typealias ProcessLight = (Light) -> Void

class LightGrid {

	private let kLoggingOn = false

	//TODO: on raf interview - settings for class in private enum
//	private enum Settings {
//	kLoggingOn = false
//	}

	//second option for storage - WORKS
	var lights: [[Light]]

	init() {
		lights = [[Light]]()
		for row in 0...999 {
			lights.append([Light]())
			for _ in 0...999 {
				lights[row].append(Light())
			}
		}
	}

//	//!!! NOT Working - 1 instance linked to all cells of array
//	private var lights: [[Light]] = Array(repeating: Array(repeating: Light(), count: 1_000), count: 1_000)

		/*
		 Test Case '-[ChristmasLightsTests.ChristmasLightsTests testShouldToggleFirstRow]' started.

		 LightGrid toggle - coord: CoordinatePair(leftTopX: 0, leftTopY: 0, rightBottomX: 10, rightBottomY: 0)

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

	private func getLight(row: Int, col: Int) -> Light {
		return lights[row][col]
	}

	func process(coord: CoordinatePair, processLight: ProcessLight) {
		for row in coord.leftTopY...coord.rightBottomY {
			for col in coord.leftTopX...coord.rightBottomX {

				let light = getLight(row: row, col: col)

				if kLoggingOn {
					print("\nprocessLight - row - \(row), col = \(col)")
					print("processLight - pre Process - \(light) - \(String.pointer(light))")
					dump(light)
				}
				processLight(light)
				if kLoggingOn {
					print("processLight - after Process - \(light) - \(String.pointer(light))")
					dump(light)
				}
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
