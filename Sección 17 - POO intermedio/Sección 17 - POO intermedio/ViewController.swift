//
//  ViewController.swift
//  Sección 17 - POO intermedio
//
//  Created by Jacob Aguilar on 19-02-24.
//

import UIKit

class ViewController: UIViewController {
    
    var tipoAutomovil = TipoAutomovil.base

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }

    @IBAction func crearAutomovilBaseAction(_ sender: Any) {
        tipoAutomovil = .base
        performSegue(withIdentifier: "segueSengundaPantalla", sender: self)
    }
    
    @IBAction func crearMazdaAction(_ sender: Any) {
        tipoAutomovil = .mazda
        performSegue(withIdentifier: "segueSengundaPantalla", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SegundaPantallViewController {
            destination.tipoAutomovil = self.tipoAutomovil
        }
    }
}

enum TipoAutomovil {
    case base
    case mazda
}
