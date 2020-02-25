//
//  EquilateralTriangle.swift
//  a_swift_tour
//
//  Created by Sem Spanhaak on 25/02/2020.
//  Copyright © 2020 Sem Spanhaak. All rights reserved.
//

class EquilateralTriangle: Shape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
