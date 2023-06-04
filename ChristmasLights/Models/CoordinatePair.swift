//
//  CoordinatePair.swift
//  ChristmasLights
//
//  Created by Pavlo Vasylenko on 01.06.2023.
//

import Foundation

struct CoordinatePair {
	let leftTopX: Int
	let leftTopY: Int
	let rightBottomX: Int
	let rightBottomY: Int
}

extension CoordinatePair {
	init(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) {
		self.init(leftTopX: x1,
				  leftTopY: y1,
				  rightBottomX: x2,
				  rightBottomY: y2)
	}
}

