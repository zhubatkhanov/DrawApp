//
//  Models.swift
//  DrawApp
//
//  Created by Sanzhar Zhubatkhanov on 18.02.2023.
//

import UIKit

struct FreeDrawings {
    let color: UIColor
    var points: [CGPoint]
}

struct RectangleDrawings {
    let color: UIColor
    let opacity: Bool
    var points: [CGPoint]
}
struct TriangleDrawings {
    let color: UIColor
    let opacity: Bool
    var points: [CGPoint]
}
struct CircleDrawings {
    let color: UIColor
    let opacity: Bool
    var points: [CGPoint]
}
struct LineDrawings {
    let color: UIColor
    var points: [CGPoint]
}
