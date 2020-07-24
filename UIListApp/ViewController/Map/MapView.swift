//
//  MapView.swift
//  UIListApp
//
//  Created by Kazuki on 2020/07/24.
//  Copyright © 2020 susu. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var annotations: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        // 初期でJocyにポイントを置く
        let coordinate = CLLocationCoordinate2D(
            latitude: 35.667208, longitude: 139.714008)

        // 縮尺
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)

        return mapView
    }

    // 描画更新
    func updateUIView(_ uiView: MKMapView, context: Context) {
        if annotations.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotations(annotations)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // 更新クラス(delegate)
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
    }
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Jocy, Inc."
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 35.667208, longitude: 139.714008)
        return annotation
    }
}

struct MapView_Previews: PreviewProvider {

    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate),annotations: [MKPointAnnotation.example])
    }
}

