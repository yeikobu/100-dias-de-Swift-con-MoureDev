//
//  HomeViewController.swift
//  Sección 20 - Calculadora
//
//  Created by Jacob Aguilar on 29-02-24.
//

import UIKit

final class HomeViewController: UIViewController {
    //MARK: - Outlets
    
    //Result
    @IBOutlet weak var resultLabel: UILabel!
    
    //Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    //Oparators
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    //MARK: - Variables
    private var total: Double = 0
    private var temp: Double = 0
    private var operating = false //Indica si se ha seleccionado un operador
    private var decimal = false //Indica si el valor es decimal
    private var operation: OperationType = .none
    
    //MARK: - Constantes
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLenght = 9
    private let kMaxValue: Double = 99999999
    private let kMinValue: Double = 0.00000001
    
    private enum OperationType {
        case none, addition, substraction, multiplication, division, percent
    }
    
    //Formateo de valores auxiliares
    private var auxFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    }
    
    //Formateo de valores por pantalla por defecto
    private var printFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }
    
    //Formateo de valores formato cientifico
    private var printSchientificFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }
    
    //MARK: - Initialization
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorAddition.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
    
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        result()
    }
    
    //MARK: - Button Actions
    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        if operation != .percent {
            result()
        }
        
        operating = true
        operation = .percent
        result()
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .addition
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .substraction
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .multiplication
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .division
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLenght {
            return
        }
        
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) { //sender es de tipo botón y acada botón le agregamos un tag
        operatorAC.setTitle("C", for: .normal)
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLenght {
            return
        }
        
        //Hemos seleccionado una operación
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        //Hemos seleccionado decimales
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        print(sender.tag)
        sender.shine()
    }
    
    //Limpia los valores
    private func clear() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    //Obtiene el resultado final
    private func result() {
        switch operation {
        case .none:
            //No hacemos nada
            break
        case .addition:
            total += temp
        case .substraction:
            total -= temp
        case .multiplication:
            total *= temp
        case .division:
            total /= temp
        case .percent:
            temp = temp / 100
            total = temp
        }
        
        //Formateo en pantalla
        if total <= kMaxValue || total >= kMinValue {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        print("Total: \(total)")
    }
    
}
