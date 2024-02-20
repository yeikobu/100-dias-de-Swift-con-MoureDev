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
    var automovilNormal: Automovil?
    var automovilElectrico: AutomovilElectrico?
    var estaEncendido: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch tipoAutomovil {
        case .base:
            automovilNormal = Automovil()
            automovilImage.image = UIImage(named: "automovil")
            informacionLabel.text = "Se ha creado un auto normal exitosamente"
            print()
        case .mazda:
            automovilElectrico = AutomovilElectrico()
            automovilImage.image = UIImage(named: "autoelectrico")
            informacionLabel.text = "Se ha creado un auto eléctrico exitosamente"
        }
    }

    @IBAction func mostrarInformacionAction(_ sender: Any) {
        switch tipoAutomovil {
        case .base:
            informacionLabel.text = """
                           El automovil tiene \(automovilNormal!.numeroLlantas) llantas,\
                      es de color \(automovilNormal!.color)\
                            y su precio es de \(automovilNormal!.precio) USD
                      """
        case .mazda:
            informacionLabel.text = """
                            El automovil tiene \(automovilElectrico!.numeroLlantas) llantas,\
                             es de color \(automovilElectrico!.color),\
                             su precio es de \(automovilElectrico!.precio) USD\
                            y su carga está al \(automovilElectrico!.porcentajeBateria) de bateria
                          """
        }
    }
    
    @IBAction func endenderAction(_ sender: Any) {
        switch tipoAutomovil {
        case .base:
            if !estaEncendido {
                estaEncendido = automovilNormal!.encender()
                informacionLabel.text = "Auto encencido"
            } else {
                informacionLabel.text = "El auto ya se encuentra encendido"
            }
        case .mazda:
            if !estaEncendido {
                estaEncendido = automovilElectrico!.encender()
                informacionLabel.text = "Auto electrico encencido"
            } else {
                informacionLabel.text = "El auto electrico ya se encuentra encendido"
            }
        }
    }
    
    @IBAction func apagarAction(_ sender: Any) {
        switch tipoAutomovil {
        case .base:
            if estaEncendido {
                estaEncendido = automovilNormal!.apagar()
                informacionLabel.text = "Auto apagado"
            } else {
                informacionLabel.text = "El auto electrico ya se encuentra apagado"
            }
        case .mazda:
            if estaEncendido {
                estaEncendido = automovilElectrico!.apagar()
                informacionLabel.text = "Auto electrico apagado"
            } else {
                informacionLabel.text = "El auto electrico ya se encuentra apagado"
            }
        }
    }
    
    @IBAction func acelerarAction(_ sender: Any) {
        switch tipoAutomovil {
        case .base:
            informacionLabel.text = estaEncendido ? automovilNormal!.acelerar() : "El auto no está encendido para poder acelerar"
        case .mazda:
            informacionLabel.text = estaEncendido ? automovilElectrico!.acelerar() : "El auto electrico no está encendido para poder acelerar"
            automovilElectrico?.porcentajeBateria -= 10
        }
    }
    
}
