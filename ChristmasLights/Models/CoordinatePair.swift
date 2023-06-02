//
//  CoordinatePair.swift
//  ChristmasLights
//
//  Created by Pavlo Vasylenko on 01.06.2023.
//

import Foundation

struct CoordinatePair {
	let leftTopRow: Int
	let leftTopCol: Int
	let rightBottomRow: Int
	let rightBottomCol: Int
}

extension CoordinatePair {
	init(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) {
		self.init(leftTopRow: x1,
				  leftTopCol: y1,
				  rightBottomRow: x2,
				  rightBottomCol: y2)
	}
}

