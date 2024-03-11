//
//  ContentView.swift
//  IntrocduccionSwiftUI
//
//  Created by Jacob Aguilar on 11-03-24.
//

import SwiftUI
import MapKit

struct ContentView: UIViewRepresentable {
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: -33.4033, longitude: -70.7167)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated: true)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
}

#Preview {
    ContentView()
}
