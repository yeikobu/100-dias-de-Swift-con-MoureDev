//
//  ViewController.swift
//  EjemploProyecto
//
//  Created by Jacob Aguilar on 05-02-24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Ya cambié"
        label.text = "Ya cambié por segunda vez"
    }

    @IBAction func changeLabelText(_ sender: Any) {
        label.text = "Ya cambié pero por el botón"
    }
    
}

