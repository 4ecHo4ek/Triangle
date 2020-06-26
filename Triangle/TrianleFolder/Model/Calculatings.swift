//
//  Calculatings.swift
//  Triangle
//
//  Created by Сергей Цыганков on 26.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//

import UIKit

class Calculatings {
    
    let width: CGFloat
    let height: CGFloat
    
    func isTriangle()  {
        
        let a = constants.path1
        let b = constants.path2
        let c = constants.path3
        
        if a < b + c && b < a + c && c < a + b {
            constants.isTriangle = true
        } else {
            constants.isTriangle = false
        }
        
        //return constants.isTriangle
    }
    
     func calculateSids() -> [(CGFloat, CGFloat)] {
        
        var coordinates = [(CGFloat, CGFloat)]()
        var coordinate: (CGFloat, CGFloat) = (0.0, 0.0)
        
        let sortedArray = [constants.path1, constants.path2, constants.path3].sorted()
        let a = sortedArray[2]
        let b = sortedArray[1]
        let c = sortedArray[0]
        
        let p = (a + b + c) / 2
        let sInRect = p * (p - a) * (p - b) * (p - c)
        let s = pow(sInRect, 0.5)
        let sinaInRe = pow(2 * s / (a * b), 2.0)
        let cosa = pow(1 - sinaInRe, 0.5)
        
        let xOfHeight = b * cosa
        let yOfWeidth = 2 * s / a
        
        
        for i in 0...2 {
            
            let koef = width / height
            switch i {
            case 0:
                coordinate.0 = 0
                coordinate.1 = koef * height
            case 1:
                coordinate.0 = koef * width
                coordinate.1 = koef * height
            case 2:
                coordinate.0 = CGFloat(xOfHeight / a) * koef * width
                coordinate.1 = height - CGFloat(yOfWeidth / a) * koef * height
            default:
                break
            }
            
            coordinates.append(coordinate)
        }
        return coordinates
    }
    
    init(width: CGFloat, height: CGFloat) {
           self.width = width
           self.height = height
       }
    
}

























