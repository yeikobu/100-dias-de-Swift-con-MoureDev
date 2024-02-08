//
//  ViewController.swift
//  Seccion 12 Controles y vistas de texto
//
//  Created by Jacob Aguilar on 08-02-24.
//

import UIKit

class ViewController: UIViewController {
    //Los Outlets son las referencias a las vistas
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
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
        
        //Page Control
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .gray
        
        //Segmented control
        mySegmentedControl.removeAllSegments() //Eliminar todos los elementos antes de que se muestren en la vista, debido a que el segmented control viene cargado con dos valores de manera inicial
        for (index, value) in myPickerViewValues.enumerated() {
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
    }

    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .green
        }
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
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
    }
}

