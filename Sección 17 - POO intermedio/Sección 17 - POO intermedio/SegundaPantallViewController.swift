//
//  SegundaPantallViewController.swift
//  Sección 17 - POO intermedio
//
//  Created by Jacob Aguilar on 19-02-24.
//

import UIKit

class SegundaPantallViewController: UIViewController {

    @IBOutlet weak var automovilImage: UIImageView!
    @IBOutlet weak var informacionLabel: UILabel!
    
    var tipoAutomovil = TipoAutomovil.base
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch tipoAutomovil {
        case .base:
            informacionLabel.text = "Creación de automóvil base"
        case .mazda:
            informacionLabel.text = "Creación de automóvil Mazda"
        }
    }

    @IBAction func mostrarInformacionAction(_ sender: Any) {
    }
    
    @IBAction func endenderAction(_ sender: Any) {
    }
    
    @IBAction func apagarAction(_ sender: Any) {
    }
    
    @IBAction func acelerarAction(_ sender: Any) {
    }
    
}
