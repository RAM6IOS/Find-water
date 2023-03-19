//
//  ContentView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 12/2/2023.
import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

@MainActor
struct ContentView: View {
    @StateObject var model =  locationManger()
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.158917), free: false),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.553840, longitude: 3.114948), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.553899, longitude: 3.118301), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.552798, longitude: 3.108479), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.550966, longitude: 3.103164), free: false),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.553187, longitude: 3.108679), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.567564, longitude: 3.158442), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.546298, longitude: 3.093918), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.543958, longitude: 3.088122), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.540878, longitude: 3.080164), free: true),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.544944, longitude: 3.074616), free: true)
        
        
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
