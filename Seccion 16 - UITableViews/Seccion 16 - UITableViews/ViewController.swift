//
//  ViewController.swift
//  Seccion 16 - UITableViews
//
//  Created by Jacob Aguilar on 16-02-24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let myCountries: [String] = ["España", "Chile", "Perú", "Argentina"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.tableFooterView = UIView() //Esto por si trabajamos con versiones anteriores de iOS donde pinte celdas en blanco, lo quita y solo deja las que tienen contenido.
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Celdas simples"
        }
        
        return "Celdas custom"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Footer para celdas simples"
        }
        
        return "Footer para celdas custom"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
        cell?.myFirstLabel.text = String(indexPath.row + 1)
        cell?.mySecondLabel.text = myCountries[indexPath.row]
        
        if indexPath.row == 2 {
            cell!.mySecondLabel.text = "sdfhasdkfjhasdfjhasdf ajsdfals;jf j aksdf ljf ;lkasjdf;lja;dsfjdals;kf"
        }
        
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
}
