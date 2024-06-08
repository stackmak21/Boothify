//
//  MapObject.swift
//  Boothify
//
//  Created by Paris Makris on 2/6/24.
//

import SwiftUI
import MapKit


struct MapObject: View {
    
    let eventAddress: String
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var markers: [Marker] = []
    
    init(eventAddress: String = ""){
        self.eventAddress = eventAddress
    }
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            annotationItems: markers
        ){
            MapAnnotation(coordinate: $0.coordinate) {
                BoothifyMapMarker()
                
            }
        }
        .onTapGesture {
            openMap(address: eventAddress)
        }
//        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(length: .short)
        .onAppear {
            setRegion(for: eventAddress)
        }
    }
    
    private func openMap(address: String){
        UIApplication.shared.openURL(NSURL(string: "http://maps.apple.com?address=\(address)")! as URL)
    }
    
    func setRegion(for address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let placemarks = placemarks, let location = placemarks.first?.location {
                let coordinate = location.coordinate
                
                let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.05)
                region = MKCoordinateRegion(center: coordinate, span: span)
                
                
                let newMarker = Marker(coordinate: coordinate)
                markers.append(newMarker)
            } else {
                print("Geocoding error: \(String(describing: error))")
            }
        }
    }
    
}

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    ZStack{
        Color.background.ignoresSafeArea()
        MapObject(eventAddress: "ξανθουδακη 7")
            .padding()
            .frame(height: 300)
    }
}
