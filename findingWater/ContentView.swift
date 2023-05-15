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

 @MainActor
 struct ContentView: View {
 @StateObject var model =  locationManger()
    // @Environment(\.dismiss) var dismiss
     @Environment(\.presentationMode) var presentationMode
     
     @Environment(\.dismiss) private var dismiss



 
 let locations = [
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
 Location2(name: "10", coordinate: CLLocationCoordinate2D(latitude: 36.540878, longitude: 3.080164), free: true),
 //Location2(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.544944, longitude: 3.074616), free: true)
 
 
 ]
     @State var show:Bool = false
     
     @State private var selectedPlace: Location2?

 
 var body: some View {
 NavigationView{
     
 ZStack(alignment:.bottomTrailing){
     Map(coordinateRegion: $model.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: locations) { location in
          MapAnnotation(coordinate: location.coordinate) {
              VStack{
                  if location.free{
                      Image("water")
                          .resizable()
                          .scaledToFill()
                          .frame(width: 44, height: 44)
                          .onTapGesture {
                              selectedPlace = location

                              
                          }
                      /*
                         .sheet(isPresented: $show  ){
                                  VStack{
                                      Text("show water location")
                                          .font(.title)
                                      Text("Tapped on \(location.name)")
                                      Text("\(location.coordinate.latitude)")
                                      Text("\(location.coordinate.longitude)")
                                      
                                      
                                      Button{
                                          openMap(coordinate:  location.coordinate)
                                      }label: {
                                          Text("Direction")
                                          
                                      }
                                  }
                         }
                       */
                       
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
 }
     func openMap(coordinate:CLLocationCoordinate2D){
         let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
         mapItem.openInMaps()
         
     }
    
 }
 
 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }
 
 
