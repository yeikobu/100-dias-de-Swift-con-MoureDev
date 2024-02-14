//
//  ViewController.swift
//  Sección 14 - Vistas y controles de navegación
//
//  Created by Jacob Aguilar on 12-02-24.
//

import UIKit
import WebKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myFakeView: UIView!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "My view controller"
        myWebView.load(URLRequest(url: URL(string: "https://google.com")!))
        myMap.centerCoordinate = CLLocationCoordinate2D(latitude: 2.60, longitude: -8.31)
    }

    @IBAction func myButtonAction(_ sender: Any) {
        myFakeView.isHidden = true
    }
    
}

