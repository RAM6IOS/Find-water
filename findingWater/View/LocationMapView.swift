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
                    if #available(iOS 16.0, *) {
                        HStack(alignment:.top){
                           
                                Image("water")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                VStack{
                                    Text("Algeria ,Blida ,ouled slama")
                                        .font(.title3)
                                    VStack(alignment: .leading){
                                        Text("Coordinate")
                                        Text("latitude:\(place.location.latitude)")
                                        Text("longitude:\(place.location.longitude)")
                                    }
                                    Button{
                                        openMap(coordinate: CLLocationCoordinate2D(latitude: place.location.latitude, longitude: place.location.longitude))
                                    }label: {
                                       HStack{
                                            Image("send")
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: 25, height: 25)
                                            Text("Direction")
                                        }
                                       .foregroundColor(.white)
                                       .frame(width: 200 ,height: 50)
                                       .background(Color.blue)
                                        
                                    }
                                    
                                    
                                    .cornerRadius(10)
                                }
                            
                            Spacer()
                        }
                       .padding()
                        
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
