//
//  ViewController.swift
//  Triangle
//
//  Created by Сергей Цыганков on 26.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel! {
        didSet {
            answerLabel.text = "Является ли треугольником?"
        }
    }
    @IBOutlet weak var aLabel: UILabel! {
        didSet {
            aLabel.text = "сторона а"
        }
    }
    @IBOutlet weak var bLabel: UILabel! {
        didSet {
            bLabel.text = "сторона b"
        }
    }
    @IBOutlet weak var cLabel: UILabel! {
        didSet {
            cLabel.text = "сторона с"
        }
    }
    @IBOutlet weak var printArea: UIView!
    @IBOutlet weak var firstTF: UITextField! {
        didSet {
            firstTF.placeholder = "Введите первую сторону"
        }
    }
    @IBOutlet weak var secondTF: UITextField! {
        didSet {
            secondTF.placeholder = "Введите вторую сторону"
        }
    }
    @IBOutlet weak var therdTF: UITextField! {
        didSet {
            therdTF.placeholder = "Введите третью сторону"
        }
    }
    @IBOutlet weak var button: UIButton!
    
    
    @IBAction func enteringActionToUnlockButton(_ sender: UITextField) {
        if let _ = Double(String(firstTF.text!)),
            let _ = Double(String(secondTF.text!)),
            let _ = Double(String(therdTF.text!)) {
            button.isEnabled = true
        } else {
            button.isEnabled = false
        }
    }
    
    @IBAction func search(_ sender: UIButton) {
        
        let width = printArea.frame.size.width
        let height = printArea.frame.size.height
        let calculatings = Calculatings(width: width, height: height)
        let draw = Drawing(calculatings: calculatings)
        
        fullValues()
        calculatings.isTriangle()
        printArea.layer.addSublayer(draw.clean(width: width, height: height))
        writeLabels()
        
        guard let linesForDrawing = draw.drawLines() else { return }
        drawTriangle(lines: linesForDrawing)
        
        
    }
    
    fileprivate func fullValues() {
        
        constants.path1 = Double(String(firstTF.text!))!
        constants.path2 = Double(String(secondTF.text!))!
        constants.path3 = Double(String(therdTF.text!))!
    }
    
    fileprivate func drawTriangle(lines: [CAShapeLayer]) {
        
        for i in 0...2 {
            printArea.layer.addSublayer(lines[i])
        }
    }
    
    fileprivate func writeLabels() {
        
        aLabel.text = "Сторона a = \(constants.path1)"
        bLabel.text = "Сторона b = \(constants.path2)"
        cLabel.text = "Сторона c = \(constants.path3)"
        
        if constants.isTriangle {
            answerLabel.text = "Треугольник с данными сторонами существует"
        } else {
            answerLabel.text = "Треугольник с данными сторонами не существует"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.isEnabled = false
        
    }
    
    
}

