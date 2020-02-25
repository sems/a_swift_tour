//
//  TriangleAndSquare.swift
//  a_swift_tour
//
//  Created by Sem Spanhaak on 25/02/2020.
//  Copyright © 2020 Sem Spanhaak. All rights reserved.
//

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
