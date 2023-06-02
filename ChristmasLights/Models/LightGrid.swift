//
//  LightGrid.swift
//  ChristmasLights
//
//  Created by Pavlo Vasylenko on 01.06.2023.
//

import Foundation

class LightGrid {

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

	// !!! NOT
	var lights: [[Light]] = Array(repeating: Array(repeating: Light(), count: 1_000), count: 1_000)

	func getLight(row: Int, col: Int) -> Light {
		return lights[row][col]
	}

	func turnOn(_ coord: CoordinatePair) {
		for row in coord.leftTopRow...coord.rightBottomRow {
			for col in coord.leftTopCol...coord.rightBottomCol {
				let light = getLight(row: row, col: col)
				print("turn on - row - \(row), col = \(col)")
				dump(light)
				light.turnOn()
				dump(light)
			}
		}
	}

	func turnOff(_ coord: CoordinatePair) {
		for row in coord.leftTopRow...coord.rightBottomRow {
			for col in coord.leftTopCol...coord.rightBottomCol {
				let light = getLight(row: row, col: col)
				print("turn off - row - \(row), col = \(col)")
				dump(light)
				light.turnOff()
				dump(light)
			}
		}
	}

	func toggle(_ coord: CoordinatePair) {
		for row in coord.leftTopRow...coord.rightBottomRow {
			for col in coord.leftTopCol...coord.rightBottomCol {
				let light = getLight(row: row, col: col)
				print("toggle - row - \(row), col = \(col)")
				dump(light)
				light.toggle()
				dump(light)
			}
		}
	}
}
