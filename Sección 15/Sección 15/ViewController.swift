//
//  ViewController.swift
//  Sección 15
//
//  Created by Jacob Aguilar on 15-02-24.
//

import UIKit

class ViewController: UIViewController {
    
    var titleText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func blackButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "BlackVC", sender: self) //Conexión por el identifier del segue(Segue es la flecha con la que conectamos el vc a otro vc)
        titleText = "Negro"
    }
    
    @IBAction func pinkButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "PinkVC", sender: self)
        titleText = "Rosa"
    }
    
    @IBAction func mintButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "MintVC", sender: self)
        titleText = "Menta"
    }
    
    //Sobreescribe la función que prepara los segue, para así asignarle a cada segue la información que nosotros queremos
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Inicio tarea
        var titulo: String?
        var bgColor: UIColor?
        
        switch segue.identifier {
        case "BlackVC":
            titulo = "Negro"
            bgColor = .black
        case "PinkVC":
            titulo = "Rosa"
            bgColor = .systemPink
        case "MintVC":
            titulo = "Menta"
            bgColor = .systemMint
        default:
            titulo = "Defecto"
            bgColor = .green
        }
        
        if let destination = segue.destination as? PinkViewController {
            destination.titleText = titulo
            destination.bgColor = bgColor
        }
        //Fin tarea
        
        
//        if segue.identifier == "BlackVC" { //Si el identificador del segue es "BlackVC"
//            //Entonces obtenemos el acceso a los datos del BlackViewController
//            if let destination = segue.destination as? BlackViewController {
//                destination.titleText = "Negro"
//            }
//        }
        
//        if segue.identifier == "PinkVC" {
//            if let destination = segue.destination as? PinkViewController {
//                destination.titleText = "Rosa"
//            }
//            
//        }
//        
//        if segue.identifier == "PinkVC" {
//            if let destination = segue.destination as? PinkViewController {
//                destination.titleText = "Menta"
//            }
//        }
    }
}

