//
//  Circle.swift
//  a_swift_tour
//
//  Created by Sem Spanhaak on 25/02/2020.
//  Copyright © 2020 Sem Spanhaak. All rights reserved.
//

import Foundation

class Circle: Shape {
    var radius: Int
    
    init(radius: Int, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
    }
    
    func area() -> Double {
        // Pi*R power of 2
        return pow(Double(radius), 2) * Double.pi
    }
    
    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)."
    }
}
