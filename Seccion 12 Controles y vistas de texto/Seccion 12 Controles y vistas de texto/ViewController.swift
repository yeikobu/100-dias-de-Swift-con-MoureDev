//
//  ViewController.swift
//  Seccion 12 Controles y vistas de texto
//
//  Created by Jacob Aguilar on 08-02-24.
//

import UIKit

class ViewController: UIViewController {
    //Todos los controles que tenemos en UIKit derivan de una super clase llamada UICOntrol. UIControl a su vez tiene otra super clase llamda UIVIew(Una vista genérica en iOS), por eso tenemos propiedades comunes entre muchos controles, como el background color.
    
    //Los Outlets son las referencias a las vistas
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myStepperLabel: UILabel!
    @IBOutlet weak var mySwitchLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    private let myPickerViewValues = ["Uno", "Dos", "Tes", "Cuatro", "Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myButton.setTitle("Mi botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        myButton.layer.cornerRadius = 10
        
        //Picker
//        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        //Page Control
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .gray
        
        //Segmented control
        mySegmentedControl.removeAllSegments() //Eliminar todos los elementos antes de que se muestren en la vista, debido a que el segmented control viene cargado con dos valores de manera inicial
        for (index, value) in myPickerViewValues.enumerated() {
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        //Slider
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.value = 1 //El valor que estará seleccionado por defecto
        
        //Stepper
        myStepper.minimumValue = 1
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        //Switch
        mySwitch.onTintColor = .purple
        mySwitch.isOn = false
        
        //Progress view
        myProgressView.progress = 0
        
        //Indicator
        myActivityIndicator.startAnimating()
        myActivityIndicator.color = .orange
        myActivityIndicator.hidesWhenStopped = true
        
        //Labels
        myStepperLabel.textColor = .darkGray
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 36)
        myStepperLabel.text = "1"
        
        mySwitchLabel.text = "Apagado"
        
        //TextField
        myTextField.textColor = .brown
        myTextField.placeholder = "Escribe algo"
        myTextField.delegate = self
        
        //TextView
        myTextView.textColor = .brown
        myTextView.delegate = self
    }

    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .green
        }
        
        myTextView.resignFirstResponder()
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
        mySlider.value = Float(myPageControl.currentPage + 1) //Tarea de relacionar las vistas
        myStepper.value = Double(myPageControl.currentPage + 1)
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        mySlider.value = Float(mySegmentedControl.selectedSegmentIndex + 1) //Tarea de relacionar las vistas
        myStepper.value = Double(mySegmentedControl.selectedSegmentIndex + 1) //Tarea 2 de relacionar las vistas con el stepper
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        var mySliderValue: Int = Int(mySlider.value)
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        var progress: Float = 0.0
        
        switch mySlider.value {
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
            progress = 0.2
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
            progress = 0.4
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
            progress = 0.6
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
            progress = 0.8
        default:
            mySegmentedControl.selectedSegmentIndex = 4
            progress = 1.0
            
        }
        
        myPageControl.currentPage = mySliderValue - 1 //Tarea de relacionar las vistas
        myPickerView.selectRow(mySliderValue - 1, inComponent: 0, animated: true) //Tarea de relacionar las vistas
        myStepper.value = Double(mySliderValue)
        
        myProgressView.progress = progress
    }
    
    @IBAction func myStepperAction(_ sender: Any) {
        let value = myStepper.value
        myPickerView.selectRow(Int(value - 1), inComponent: 0, animated: true)
        mySlider.value = Float(value)
        myPageControl.currentPage = Int(value - 1)
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        mySegmentedControl.selectedSegmentIndex = Int(value - 1)
        
        myStepperLabel.text = "\(Int(value))"
    }
    
    @IBAction func mySwitchAction(_ sender: Any) {
        myPickerView.isHidden = !mySwitch.isOn
        myPickerView.isHidden ? myActivityIndicator.startAnimating() : myActivityIndicator.stopAnimating()
        mySwitchLabel.text = mySwitch.isOn ? "Encendido" : "Apagado"
    }
}


//Las operaciones del protocolo DataSource sirven para cargar datos en nuestras vistas
//Las operaciones del protocolo Delegate sirven para interactuar con nuestra vista
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { //Columnas del picker //Del protocolo DataSource
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { //Cantidad de elementos en la fila //Del protocolo DataSource
        return myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { //Titulos para cada fila //Del protocolo DataSource
        return myPickerViewValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { //Interacción con otros elementos //Del protocolo Delegate
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        myPageControl.currentPage = row
        mySegmentedControl.selectedSegmentIndex = row
        mySlider.value = Float(row + 1) //Tarea de relacionar las vistas
        myStepper.value = Double(row + 1)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //Cuando el usuario presiona enter en el teclado
        textField.resignFirstResponder() //El teclado se cierra
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(myTextField.text, for: .normal)
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        myTextField.isHidden = false
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        myTextField.isHidden = false
    }
}
