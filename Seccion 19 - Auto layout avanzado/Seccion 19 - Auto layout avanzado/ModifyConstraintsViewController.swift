//
//  ModifyConstraintsViewController.swift
//  Seccion 19 - Auto layout avanzado
//
//  Created by Jacob Aguilar on 23-02-24.
//

import UIKit

class ModifyConstraintsViewController: UIViewController {
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightConstraint.constant = 300
        topConstraint.constant = 64
    }
    
}
