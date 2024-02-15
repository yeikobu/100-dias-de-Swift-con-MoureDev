//
//  PinkViewController.swift
//  Sección 15
//
//  Created by Jacob Aguilar on 15-02-24.
//

import UIKit

class PinkViewController: UIViewController {
    
    var titleText: String? 
    var bgColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let finalTitle = titleText {
            title = finalTitle
        }
        
        if let bgColor = bgColor {
            view.backgroundColor = bgColor
        }
    }

}
