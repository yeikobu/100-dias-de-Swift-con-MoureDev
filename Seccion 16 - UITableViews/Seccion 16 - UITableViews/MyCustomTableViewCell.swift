//
//  MyCustomTableViewCell.swift
//  Seccion 16 - UITableViews
//
//  Created by Jacob Aguilar on 16-02-24.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() { //Lo que se invoca cuando se instancia
        super.awakeFromNib()
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .blue
        
        mySecondLabel.numberOfLines = 0
        
        backgroundColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) { //Lo que se invoca cuando seleccionemos la celda
        super.setSelected(selected, animated: animated)

        print(myFirstLabel.text ?? "")
    }
    
}
