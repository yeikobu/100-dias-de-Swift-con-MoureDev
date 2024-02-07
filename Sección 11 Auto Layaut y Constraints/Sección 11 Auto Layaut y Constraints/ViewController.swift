//
//  ViewController.swift
//  Sección 11 Auto Layaut y Constraints
//
//  Created by Jacob Aguilar on 07-02-24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.text = "Ya cambié"
        label.text = "Ya cambié por segunda vez"
    }


    @IBAction func changeLabelText(_ sender: Any) {
        label.text = "El texto ha cambiado finalmente"
    }
}

