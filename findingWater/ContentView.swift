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
 
 let locations = [
 Location2(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), free: true),
 Location2(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.158917), free: false),
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
                              show.toggle()
                              print("Tapped on \(location.name)")
                              
                          }
                        /*  .sheet(isPresented: $show){
                             
                                  VStack{
                                      Text("show water location")
                                          .font(.title)
                                      Text("\(location.coordinate.latitude)")
                                      Text("\(location.coordinate.longitude)")
                                      
                                      
                                      Button{
                                          openMap(coordinate:  location.coordinate)
                                      }label: {
                                          Text("Direction")
                                          
                                      }
                                  }
                              
                         }*/
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
     
     .sheet(isPresented: $show){
         ScrollView{
             ForEach(locations){ locatio in
                 VStack{
                     Text("show water location")
                         .font(.title)
                     Text("\(locatio.coordinate.latitude)")
                     Text("\(locatio.coordinate.longitude)")
                     
                     
                     Button{
                         openMap(coordinate:  locatio.coordinate)
                     }label: {
                         Text("Direction")
                         
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
 
 
