//
//  SegundoViewController.swift
//  Seccion 18 - Ciclo de vida de la App y del ViewController
//
//  Created by Jacob Aguilar on 21-02-24.
//

import UIKit

class SegundoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Estoy en el segundo view controller y estoy activo en la función: \(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Estoy en el segundo view controller y estoy activo en la función: \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Estoy en el segundo view controller y estoy activo en la función: \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Estoy en el segundo view controller y estoy activo en la función: \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("Estoy en el segundo view controller y estoy activo en la función: \(#function)")
    }

}
