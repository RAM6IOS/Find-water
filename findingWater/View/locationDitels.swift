//
//  locationDitels.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 15/6/2023.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase
import FirebaseAuth
import CoreLocation
import CoreLocationUI
import CoreLocation
import MapKit

struct locationDitels: View {
    var soures:Sources
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
    @ObservedObject var viewModel2 = CreateAccount()
    @ObservedObject var mapViewModel = LocationMapViewModel()
    var body: some View {
        VStack(alignment: .leading){
            Image("caption")
                .resizable()
                           .scaledToFit()
                           .aspectRatio(contentMode: .fill)
                           .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 300, alignment: .center)
                           //.clipped()
            VStack(alignment: .leading,spacing: 10){
                Text(soures.name)
                    .font(.title)
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Algeria ,Blida ,ouled slama")
                        
                }
                .font(.title3)
                Text("Coordinate:")
                    .font(.title3)
                Text("latitude:\(soures.location.latitude)")
                Text("latitude:\(soures.location.longitude)")
                
                Button{
                    openMap(coordinate: CLLocationCoordinate2D(latitude: soures.location.latitude, longitude: soures.location.longitude))
                }label: {
                    HStack{
                        Text("Get Directions")
                           
                        Image(systemName: "arrow.forward")
                    }
                    .foregroundColor(.white)
                    .frame(width: 350 ,height: 50)
                    .background(Color.blue)
                    
                }
                .cornerRadius(25)
            }
            .padding()
            VStack{
                Text("People on Site:")
                    .font(.title3)
                    .bold()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        Button{
                            
                            if viewModel2.userSession != nil  {
                                viewModel2.currentUser?.value.toggle()
                                
                                let docData: [String: Any] = [
                                    // "uid": uid,
                                    "name": "PoutineFiesta",
                                    "address": "1234 Restaurant St"
                                ]
                                let db = Firestore.firestore()
                                
                                let docRef = db.collection(soures.name).document()
                                
                                docRef.setData(docData) { error in
                                    if let error = error {
                                        print("Error writing document: \(error)")
                                    } else {
                                        print("Document successfully written!")
                                    }
                                }
                                
                                viewModel2.EditProducti(id: viewModel2.currentUser?.id  ?? "reewwedsewd", value: viewModel2.currentUser?.value ?? true)
                            }
                            
                        } label: {
                            Image(systemName: "plus")
                            // .foregroundColor(.white)
                                .padding()
                            //.background(.green)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 1))
                        }
                        .disabled( viewModel2.currentUser?.value == true)
                        ForEach(mapViewModel.user, id: \.self) { item in
                            Button{
                                if viewModel2.userSession != nil &&   viewModel2.currentUser?.value == true {
                                    viewModel2.currentUser?.value.toggle()
                                    
                                    Firestore.firestore().collection(soures.name).document(item.id ?? "eereded").delete() { err in
                                        if let err = err {
                                            print("Error removing document: \(err)")
                                        } else {
                                            print("Document successfully removed!")
                                        }
                                    }
                                    
                                    viewModel2.EditProducti(id: viewModel2.currentUser?.id  ?? "reewwedsewd", value:  viewModel2.currentUser?.value ?? false )
                                    
                                }
                                
                            } label: {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.green)
                                    .clipShape(Circle())
                            }
                            
                        }
                    }
                    .onAppear{
                        mapViewModel.fetchData2(mdel:soures.name)
                        self.viewModel2.fetchUser()
                        //.viewModel2.userSession
                        
                    }
                }
            }
            .padding()
        }
        
        .navigationTitle(soures.name)
    }
    func openMap(coordinate:CLLocationCoordinate2D){
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
        
    }
}


