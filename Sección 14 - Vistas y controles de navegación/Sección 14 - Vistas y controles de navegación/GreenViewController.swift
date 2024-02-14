//
//  GreenViewController.swift
//  Sección 14 - Vistas y controles de navegación
//
//  Created by Jacob Aguilar on 14-02-24.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.isHidden = true
        mySearchBar.delegate = self
    }
}

extension GreenViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mySearchBar.resignFirstResponder()
        
        myLabel.text = mySearchBar.text
        myLabel.isHidden = false
    }
}
