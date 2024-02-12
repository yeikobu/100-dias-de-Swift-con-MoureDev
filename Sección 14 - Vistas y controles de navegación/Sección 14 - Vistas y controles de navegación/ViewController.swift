//
//  ViewController.swift
//  Sección 14 - Vistas y controles de navegación
//
//  Created by Jacob Aguilar on 12-02-24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myFakeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func myButtonAction(_ sender: Any) {
        myFakeView.isHidden = true
    }
    
}

