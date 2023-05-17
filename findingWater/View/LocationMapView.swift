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
    @State private var selectedPlace: Location2?
   
        var body: some View {
            NavigationView{
                ZStack(alignment:.bottomTrailing){
                    Map(coordinateRegion: $mapController.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: mapController.locations) { location in
                        
                        MapAnnotation(coordinate: location.coordinate){
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
                
                
                    if #available(iOS 16.0, *) {
                        VStack{
                            HStack(spacing:10){
                                Image("water")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                VStack{
                                    Text(place.name)
                                        .font(.title3)
                                    VStack{
                                        Text("Coordinate")
                                        Text("latitude:\(place.coordinate.latitude)")
                                        Text("longitude:\(place.coordinate.longitude)")
                                    }
                                    Button{
                                        openMap(coordinate:  place.coordinate)
                                    }label: {
                                        VStack{
                                            Image(systemName: "car.fill")
                                            Text("Direction")
                                        }
                                        
                                    }
                                }
                            }
                        }
                        .presentationDetents([.height(300)])
                        .presentationDragIndicator(.hidden)
                    } else {
                        // Fallback on earlier versions
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
