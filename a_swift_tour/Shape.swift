//
//  Shape.swift
//  a_swift_tour
//
//  Created by Sem Spanhaak on 25/02/2020.
//  Copyright © 2020 Sem Spanhaak. All rights reserved.
//

import Foundation

class Shape {
    var numberOfSides = 0
    var name: String = ""
  
    init(name: String) {
        self.name = name
    }
    
    deinit {
        self.name = ""
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

