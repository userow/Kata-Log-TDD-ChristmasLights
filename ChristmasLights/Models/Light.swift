//
//  Light.swift
//  ChristmasLights
//
//  Created by Pavlo Vasylenko on 01.06.2023.
//

import Foundation

class Light {
	private var on = false

	func isOn() -> Bool {
		return on
	}

	func turnOn() {
		on = true
	}

	func turnOff() {
		on = false
	}

	func toggle() {
		on.toggle()
	}
}
