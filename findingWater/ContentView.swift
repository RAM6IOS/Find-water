//
//  ContentView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 12/2/2023.
import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI
//import SwiftProtobuf
import GameKit

 //@MainActor
/*
 struct ContentView: View {
     //@ObservedObject var model =  locationManger()
    // @State var show:Bool = false
    // @State private var selectedPlace: Location2?
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

 var body: some View {
 NavigationView{
     ZStack(alignment:.topLeading){
         Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: locations) { location in
          MapAnnotation(coordinate: location.coordinate) {
              VStack{
                 
                      Image("water")
                          .resizable()
                          .scaledToFill()
                          .frame(width: 44, height: 44)
                          .onTapGesture {
                              //selectedPlace = location

                              
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
        
 }
    

     .ignoresSafeArea(.all, edges: .top)
 }
   
     /*
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
      */
    
    
 }
     /*
     func openMap(coordinate:CLLocationCoordinate2D){
         let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
         mapItem.openInMaps()
         
     }
      */
    
 }
 
 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }
 */
 
