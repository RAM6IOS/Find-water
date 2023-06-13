//
//  ContentView2.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 17/5/2023.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI
import Firebase
import FirebaseFirestoreSwift

struct ContentView2: View {
    @ObservedObject var mapController = MapController()
    //@ObservedObject var model =  locationManger()
   // @State private var selectedPlace: Location2?
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
    
    @State private var  region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.108917),
                                               span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    @State private  var locations = [
        Location2(name: "-1", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), free: true),
        Location2(name: "0", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.158917), free: false),
        Location2(name: "1", coordinate: CLLocationCoordinate2D(latitude: 36.553840, longitude: 3.114948), free: true),
        Location2(name: "2", coordinate: CLLocationCoordinate2D(latitude: 36.553899, longitude: 3.118301), free: true),
        Location2(name: "4", coordinate: CLLocationCoordinate2D(latitude: 36.552798, longitude: 3.108479), free: true),
        Location2(name: "5", coordinate: CLLocationCoordinate2D(latitude: 36.550966, longitude: 3.103164), free: false),
        Location2(name: "6", coordinate: CLLocationCoordinate2D(latitude: 36.553187, longitude: 3.108679), free: true),
        Location2(name: "7", coordinate: CLLocationCoordinate2D(latitude: 36.567564, longitude: 3.158442), free: true),
        Location2(name: "8", coordinate: CLLocationCoordinate2D(latitude: 36.546298, longitude: 3.093918), free: true),
        Location2(name: "9", coordinate: CLLocationCoordinate2D(latitude: 36.543958, longitude: 3.088122), free: true),
        Location2(name: "10", coordinate: CLLocationCoordinate2D(latitude: 36.540878, longitude: 3.080164), free: true)
    ]
    @State private var selectedPlace: Sources?
    @ObservedObject var mapViewModel = LocationMapViewModel()
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 20) {
               
                 ForEach(mapViewModel.books, id: \.id) { place in
                     Text(place.name)
                         .onTapGesture {
                       self.selectedPlace = place
                            
                     }
                         .onAppear{
                             mapViewModel.fetchData2(mdel:place.name)
                         }
                 
                     
                    
               }
                
             }
             .sheet(item: $selectedPlace) { place in
                 
                 VStack{
                     Button{
                         
                         
                         mapViewModel.createRestaurant(mdel: place.name)
                         mapViewModel.fetchData2(mdel:place.name)
                     } label: {
                         Text("add new location user \(place.name)")
                     }
                     ForEach(mapViewModel.user, id: \.self) { item in
                         Text(item.name)
                         
                     }
                     .onAppear{
                         mapViewModel.fetchData2(mdel:place.name)
                     }
                 }
                 /*
                 if #available(iOS 16.0, *) {
                     VStack{
                         Text("add new location user")
                             .font(.title)
                         Button{
                             mapViewModel.EditProducti(id: place.id ?? "redcw", user: String( place.user.count))
                         }label: {
                             Text("add new user")
                                 .foregroundColor(.white)
                                 .frame(width: 200, height: 79)
                                 .background(.blue)
                         }
                         Button{
                             mapViewModel.rmove(id: place.id ?? "nr3ecwkjn", user: String(place.user.count) )
                            // mapViewModel.EditProducti(id: place.id ?? "nr3ecwkjn", value: place)
                             mapViewModel.fetchData()
                         }label: {
                             Text("rove")
                                 .foregroundColor(.white)
                                 .frame(width: 200, height: 79)
                                 .background(.blue)
                         }
                         
                         
                         
                         
                         
                     }
                     .presentationDetents([.height(300)])
                 } else {
                     // Fallback on earlier versions
                 }
                  */
             }
           }
        /*
        NavigationView{
            ZStack(alignment:.topLeading){
                Map(coordinateRegion: $mapController.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: locations) { location in
                 MapAnnotation(coordinate: location.coordinate) {
                     VStack{
                        
                             Image("water")
                                 .resizable()
                                 .scaledToFill()
                                 .frame(width: 44, height: 44)
                                 .onTapGesture {
                                     selectedPlace = location

                                     
                                 }
                         
                         /*else{
                             Image("notfreewater")
                                 .resizable()
                                 .scaledToFill()
                                 .frame(width: 44, height: 44)
                                 .onTapGesture {
                                     print("Tapped on \(location.name)")
                                 }
                         }*/
                     }
        }
        }
            
        /*
        LocationButton(.currentLocation){
        //model.requesAllowOnceLocationPermission()
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
         */
               
        }
           

            .ignoresSafeArea(.all, edges: .top)
        }
         */
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
