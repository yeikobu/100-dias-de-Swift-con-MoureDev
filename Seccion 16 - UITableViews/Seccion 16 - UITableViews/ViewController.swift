//
//  ViewController.swift
//  Seccion 16 - UITableViews
//
//  Created by Jacob Aguilar on 16-02-24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let myCountries: [String] = ["Espana", "Chile", "Perú", "Argentina"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView() //Esto por si trabajamos con versiones anteriores de iOS donde pinte celdas en blanco, lo quita y solo deja las que tienen contenido.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
            cell?.backgroundColor = .gray
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
//            cell?.selectionStyle = .none //Si quieremos que no se marque la celda cuando la seleccionamos
            cell?.accessoryType = .disclosureIndicator //Para poner la flecha
        }
            
        cell!.textLabel?.text = myCountries[indexPath.row]
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
}
