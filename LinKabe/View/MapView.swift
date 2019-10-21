//
//  MapView.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/5.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    let reuseId = "LKBAnnotationView"
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        mapView.register(LKBAnnotationView.self, forAnnotationViewWithReuseIdentifier: reuseId)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotations(from: uiView)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

final class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView

    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let coordinates = view.annotation?.coordinate else { return }
        let span = mapView.region.span
        let region = MKCoordinateRegion(center: coordinates, span: span)
        mapView.setRegion(region, animated: true)
        print(coordinates)
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("will start loading map")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("did finish loading map")
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        print("will start locating user")
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        print("did stop locating user")
    }
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("will start rendering map")
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print("did change visible region")
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        print("did add", views.count)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("did deselect")
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("did update", userLocation.coordinate)
        mapView.setCenter(userLocation.coordinate, animated: false)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotaionView = mapView.dequeueReusableAnnotationView(withIdentifier: control.reuseId) as! LKBAnnotationView
        annotaionView.annotation = annotation
        return annotaionView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("calloutAccessoryControlTapped")
        if let annotaion = view.annotation {    mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotation(annotaion)
        }
    }
}
