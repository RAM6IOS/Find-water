//
//  LocationMapView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 19/3/2023.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct LocationMapView: View {
    /*
    @State  var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
     */
    @ObservedObject var mapController = MapController()
       // @ObservedObject var  LocationMapVM = LocationMapViewModel()
        var body: some View {
            NavigationView{
                ZStack(alignment:.bottomTrailing){
                    Map(coordinateRegion: $mapController.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: mapController.businesses) { location in
                        
                        MapAnnotation(coordinate: location.coordinate){
                            Image(systemName: "mappin.and.ellipse")
                                .font(.title)
                                .foregroundColor(.pink)
                                .onTapGesture {
                                    mapController.setSelectedBusiness(for: location)
                                }
                                                    }
                        /*
                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude:  location.location.latitude, longitude:  location.location.longitude)) {
                
                Image("water")
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                
                }
                         */
                }
                    .sheet(isPresented: $mapController.isBusinessViewShowing){
                        BusinessView(mapController: mapController)
                    }
                }
                .ignoresSafeArea(.all, edges: .top)
                
                }
                
            }
        }



struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}
