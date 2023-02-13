//
//  ContentView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 12/2/2023.
import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI
struct ContentView: View {
    @StateObject var model =  locationManger()
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.158917), free: false)
    ]
    var body: some View {
        NavigationView{
            ZStack(alignment:.bottomTrailing){
                Map(coordinateRegion: $model.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        if location.free{
                            Image("water")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 44, height: 44)
                                .onTapGesture {
                                    print("Tapped on \(location.name)")
                                }
                        } else{
                            Image("notfreewater")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 44, height: 44)
                                .onTapGesture {
                                    print("Tapped on \(location.name)")
                                }
                        }
                    }
                }
                LocationButton(.currentLocation){
                    model.requesAllowOnceLocationPermission()
                }
                .foregroundColor(.white)
                .cornerRadius(8)
                .labelStyle(.iconOnly)
                .symbolVariant(.fill)
                .tint(.blue)
                .frame(width: 40)
                .clipShape(Circle())
                .padding(.bottom ,50)
                .padding(.trailing ,30)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
