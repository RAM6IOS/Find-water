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
import Firebase
import FirebaseFirestoreSwift
import CoreLocation

struct LocationMapView: View {
    
    @ObservedObject var mapController = MapController()
    @ObservedObject var model =  LocationManger()
    @State private var selectedPlace: Sources?
    @ObservedObject var mapViewModel = LocationMapViewModel()
    @ObservedObject var userlocation = UserLocation()
    @StateObject var viewModel = BookViewModel()
    @EnvironmentObject var viewModel2 : CreateAccount
    
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
        var body: some View {
            NavigationView{
                ZStack(alignment:.bottomTrailing){
                    Map(coordinateRegion: $mapController.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems:mapViewModel.source) { location in
                        
                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.location.latitude, longitude: location.location.longitude)){
                            NavigationLink(destination: LocationDitels(soures: location)) {
                                Image("water")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 44, height: 44)
                                   
                                    .onAppear{
                                        // mapViewModel.fetchData2(mdel:location.name)
                                        //self.viewModel2.fetchUser()
                                    }
                            }
                            
                                                    }
                }/*
                    .sheet(isPresented: $mapController.isBusinessViewShowing){
                        BusinessView(mapController: mapController)
                    }
                  */
                    /*
                    .sheet(item: $selectedPlace) { place in
                        ScrollView {
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
                            
                            LazyVGrid(columns: columns, spacing: 20) {
                                Text(place.name)
                                
                               
                                    Button{
                                        
                                        
                                       //
                                      
                                            viewModel2.editProducti(id: viewModel2.currentUser?.id  ?? "reewwedsewd", value: true ?? true)
                                            //mapViewModel.createRestaurant(mdel: place.name)
                                            
                                            let docData: [String: Any] = [
                                                // "uid": uid,
                                                "name": "PoutineFiesta",
                                                "address": "1234 Restaurant St"
                                            ]
                                            let db = Firestore.firestore()
                                            
                                            let docRef = db.collection(place.name).document()
                                            
                                            docRef.setData(docData) { error in
                                                if let error = error {
                                                    print("Error writing document: \(error)")
                                                } else {
                                                    print("Document successfully written!")
                                                }
                                            }
                                        viewModel2.fetchUser()
                                        print(" viewModel2.1\(viewModel2.currentUser?.value)")
                                        
                                       // viewModel2.currentUser?.value.toggle()
                                       // mapViewModel.fetchData2(mdel:place.name)
                                        
                                    } label: {
                                        Image(systemName: "plus")
                                           // .foregroundColor(.white)
                                            .padding()
                                            //.background(.green)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.black, lineWidth: 1))
                                    }
                                    
                                    ForEach(mapViewModel.user, id: \.self) { item in
                                        Button{
                                            //viewModel2.currentUser?.value.toggle()
                                           
                                                Firestore.firestore().collection(place.name).document(item.id ?? "eereded").delete() { err in
                                                    if let err = err {
                                                        print("Error removing document: \(err)")
                                                    } else {
                                                        print("Document successfully removed!")
                                                    }
                                                }
                                                //viewModel2.currentUser?.value.toggle()
                                                
                                                
                                                viewModel2.editProducti(id: viewModel2.currentUser?.id  ?? "reewwedsewd", value: false ?? false)
                                            viewModel2.fetchUser()
                                            print(" viewModel2.\(viewModel2.currentUser?.value)")
                                                
                                            
                                            
                                        } label: {
                                            Image(systemName: "person.fill")
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(.green)
                                                .clipShape(Circle())
                                        }
                                        
                                    }
                                    .onAppear{
                                       // mapViewModel.fetchData2(mdel:place.name)
                                        print(viewModel2.currentUser?.value)
                                       // self.viewModel2.fetchUser()
                                    }
                                
                            }
                        }
                      /*  ScrollView {
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
                            }*/
                       
                        /*
                        VStack{
                            HStack(alignment:.top){
                                
                                Image(place.name)
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
                                    
                                    Button{
                                        // viewModel.save()
                                    } label: {
                                        Text("Direction")
                                    }
                                }
                                
                                Spacer()
                            }
                        }*/
                        

                    }
                     */
                    
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
                
           
                 
                .ignoresSafeArea(.all, edges: .top)
                .onAppear{
                    //self.viewModel2.fetchUser()
                }
                
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
