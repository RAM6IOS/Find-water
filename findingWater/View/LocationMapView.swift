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
    
    @ObservedObject var mapController = MapController()
    @ObservedObject var model =  locationManger()
    @State private var selectedPlace: Sources?
    @ObservedObject var mapViewModel = LocationMapViewModel()
    @ObservedObject var userlocation = UserLocation()
    @StateObject var viewModel = BookViewModel()
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
   
        var body: some View {
            NavigationView{
                ZStack(alignment:.bottomTrailing){
                    Map(coordinateRegion: $mapController.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems:mapViewModel.books) { location in
                        
                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.location.latitude, longitude: location.location.longitude)){
                            Image("water")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 44, height: 44)
                                .onTapGesture {
                                    //mapController.setSelectedBusiness(for: location)
                                    selectedPlace = location
                                }
                                                    }
                }
                    .sheet(isPresented: $mapController.isBusinessViewShowing){
                        BusinessView(mapController: mapController)
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
                    .padding(.top ,50)
                    .padding(.leading ,30)
                }
                
            .sheet(item: $selectedPlace) { place in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(mapViewModel.books, id: \.self) { item in
                            Button{
                                
                            }label: {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.green)
                                    .clipShape(Circle())
                            }
                            
                        }
                       }
                    }
                

            }
                 
                .ignoresSafeArea(.all, edges: .top)
                
                }
                
            }
    func openMap(coordinate:CLLocationCoordinate2D){
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
        
    }
    
    
        }



struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}
