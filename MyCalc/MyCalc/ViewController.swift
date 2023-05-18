//
//  ViewController.swift
//  MyCalc
//
//  Created by Евгений Сергеев on 19.04.2023.
//

import UIKit



class ViewController: UIViewController {
    
    // обьявляем переменные
    
    var currentNumber: String = ""
    
    var firstNumber: String = ""
    
    var secondNumber: String = ""
    
    var operation: ((_: Double, _:Double) -> String)? = nil

    @IBOutlet weak var display: UILabel!
    
    // возможные операции
    let sum: ((_: Double, _:Double) -> String)? = {return String($0+$1)}
    let sub: ((_: Double, _:Double) -> String)? = {return String($0-$1)}
    let mult: ((_: Double, _:Double) -> String)? = {return String($0*$1)}
    let div: ((_: Double, _:Double) -> String)? = {return String($0/$1)}
    
    // есть ли точка
    var hasDot:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // кнопка сброса
    @IBAction func AC(_ sender: UIButton) {
        display.text = "0"
        currentNumber = ""
        firstNumber = ""
        secondNumber = ""
        hasDot = false
        operation = nil
    }
    
    // изменение знака +/-
    @IBAction func plusMinus(_ sender: UIButton) {
        if display.text != "0" && display.text != "0." {
            if Double(display.text!)! > 0 {
                display.text = "-" + display.text!
                currentNumber = display.text!
            } else {
                display.text = String(display.text!.dropFirst())
                currentNumber = display.text!
            }
        }
    }
    
    // точка
    @IBAction func dotBtn(_ sender: UIButton) {
        for char in currentNumber{
            if char == "." {
               hasDot = true
            }
        }
        if !hasDot && currentNumber != "" {
            currentNumber += "."
            display.text = currentNumber
        } else if !hasDot {
            currentNumber += "0."
            display.text = currentNumber
        }
    }
    
    
    // цифры
    @IBAction func digits (_ sender: UIButton) {
        if sender.tag > 0 {
            currentNumber += String(sender.tag)
            display.text = currentNumber
        } else if currentNumber == "0" || currentNumber == "" {
            currentNumber = "0"
            display.text = "0"
        } else {
            currentNumber += String(sender.tag)
            display.text = currentNumber
        }
    }
    
    // умножение деление сложение вычитание равно
    @IBAction func operations (_ sender: UIButton) {
        if sender.tag < 16 && operation == nil {
            switch sender.tag {
        case 10:
            operation = sum
            firstNumber = currentNumber
            currentNumber = ""
            hasDot = false
        case 11:
            operation = sub
            firstNumber = currentNumber
            currentNumber = ""
            hasDot = false
        case 12:
            operation = mult
            firstNumber = currentNumber
            currentNumber = ""
            hasDot = false
        case 13:
            operation = div
            firstNumber = currentNumber
            currentNumber = ""
            hasDot = false
        default:
            break
            }}  else if sender.tag < 16 && operation != nil && currentNumber != "" {
                switch sender.tag {
            case 10:
                secondNumber = currentNumber
                firstNumber = operation!(Double(firstNumber)!, Double(secondNumber)!)
                    if Double(firstNumber)! - round(Double(firstNumber)!) == 0 {
                        display.text = String(firstNumber.dropLast(2))} else {
                            display.text = firstNumber
                        }
                operation = sum
                currentNumber = ""
                hasDot = false
            case 11:
                secondNumber = currentNumber
                firstNumber = operation!(Double(firstNumber)!, Double(secondNumber)!)
                    if Double(firstNumber)! - round(Double(firstNumber)!) == 0 {
                        display.text = String(firstNumber.dropLast(2))} else {
                            display.text = firstNumber
                        }
                operation = sub
                currentNumber = ""
                hasDot = false
            case 12:
                secondNumber = currentNumber
                firstNumber = operation!(Double(firstNumber)!, Double(secondNumber)!)
                    if Double(firstNumber)! - round(Double(firstNumber)!) == 0 {
                        display.text = String(firstNumber.dropLast(2))} else {
                            display.text = firstNumber
                        }
                operation = mult
                currentNumber = ""
                hasDot = false
            case 13:
                secondNumber = currentNumber
                firstNumber = operation!(Double(firstNumber)!, Double(secondNumber)!)
                    if Double(firstNumber)! - round(Double(firstNumber)!) == 0 {
                        display.text = String(firstNumber.dropLast(2))} else {
                            display.text = firstNumber
                        }
                operation = div
                currentNumber = ""
                hasDot = false
            default:
                break
                }} else if sender.tag == 16 && operation != nil && currentNumber != "" {
                    secondNumber = currentNumber
                    firstNumber = operation!(Double(firstNumber)!, Double(secondNumber)!)
                    if Double(firstNumber)! - round(Double(firstNumber)!) == 0 {
                        display.text = String(firstNumber.dropLast(2))
                        currentNumber = String(firstNumber.dropLast(2))
                    } else {
                            display.text = firstNumber
                            currentNumber = firstNumber
                        }
                    operation = nil
                    hasDot = false
                }
    }

    
    // корень квадратный
    @IBAction func rootBtn(_ sender: UIButton) {
        firstNumber = currentNumber
        firstNumber = String(sqrt(Double(firstNumber)!))
        if Double(firstNumber)! - round(Double(firstNumber)!) == 0 {
            display.text = String(firstNumber.dropLast(2))
            currentNumber = String(firstNumber.dropLast(2))
        } else {
                display.text = firstNumber
                currentNumber = firstNumber
            }
        
        
    }
    
    
    
}


