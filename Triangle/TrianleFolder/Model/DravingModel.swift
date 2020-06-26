//
//  DravingModel.swift
//  Triangle
//
//  Created by Сергей Цыганков on 26.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//

import UIKit

class Drawing {
    
    let calculatings: Calculatings
    
    func drawLines() -> [CAShapeLayer]? {
        
        if constants.isTriangle {
            var lines = [CAShapeLayer]()
            let line = CAShapeLayer()
            let path = CGMutablePath()
            let colors: [UIColor] = [.red, .green, .blue]
            let madeCalculatings = calculatings.calculateSids()
            
            line.lineWidth = 2
            
            
            for i in 0...2 {
                var num = i + 1
                if num == 3 { num = 0}
                path.addLines(between: [CGPoint(x: madeCalculatings[i].0, y: madeCalculatings[i].1),
                                        CGPoint(x: madeCalculatings[num].0, y: madeCalculatings[num].1)])
                
                line.strokeColor = colors[i].cgColor
                
                line.path = path
                lines.append(line)
            }
             return lines
        }
        
        return nil
        
    }
    
    func clean(width: CGFloat, height: CGFloat) -> CAShapeLayer {
        let cleanArea = CAShapeLayer()
        let path = CGMutablePath()
        let rect = CGRect(x: 0.0, y: 0.0, width: width + 2.0, height: height + 2.0)
        path.addRect(rect)
        
        cleanArea.fillColor = UIColor.white.cgColor
        cleanArea.path = path
        
        return cleanArea
    }
    
    
    init(calculatings: Calculatings) {
        self.calculatings = calculatings
    }
    
    
    
}
















