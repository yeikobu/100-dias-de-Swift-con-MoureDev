//
//  BlackViewController.swift
//  Sección 15
//
//  Created by Jacob Aguilar on 15-02-24.
//

import UIKit

class BlackViewController: UIViewController {
    var titleText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let finalTitle = titleText {
            title = finalTitle
        }
        
        view.backgroundColor = UIColor.black
    }
}
