//
//  CreateConstraintsViewController.swift
//  Seccion 19 - Auto layout avanzado
//
//  Created by Jacob Aguilar on 23-02-24.
//

import UIKit

class CreateConstraintsViewController: UIViewController {

    @IBOutlet weak var yellowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Constraints de tamaño programaticamente
        yellowView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        //Constraints de posición programáticamente
        yellowView.translatesAutoresizingMaskIntoConstraints = false //Esto en false para poder utilizar las constraints que nosotros queremos
        
        //Primera forma de agregar constraint de posición
        view.addConstraint(NSLayoutConstraint(item: yellowView!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1000, constant: 16))
        
        //Segunda forma de agregar constraints de posición
        yellowView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    }
}
