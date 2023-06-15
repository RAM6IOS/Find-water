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

struct locationDitels: View {
    var soures:Sources
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
    @ObservedObject var mapViewModel = LocationMapViewModel()
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                Text(soures.name)
                
               
                    Button{
                        
                        
                       //
                      
                          //  viewModel2.EditProducti(id: viewModel2.currentUser?.id  ?? "reewwedsewd", value: true ?? true)
                            //mapViewModel.createRestaurant(mdel: place.name)
                            
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
                       // viewModel2.fetchUser()
                       // print(" viewModel2.1\(viewModel2.currentUser?.value)")
                        
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
                           
                            Firestore.firestore().collection(soures.name).document(item.id ?? "eereded").delete() { err in
                                    if let err = err {
                                        print("Error removing document: \(err)")
                                    } else {
                                        print("Document successfully removed!")
                                    }
                                }
                                //viewModel2.currentUser?.value.toggle()
                                
                                
                               // viewModel2.EditProducti(id: viewModel2.currentUser?.id  ?? "reewwedsewd", value: false ?? false)
                            //viewModel2.fetchUser()
                           // print(" viewModel2.\(viewModel2.currentUser?.value)")
                                
                            
                            
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
                       // print(viewModel2.currentUser?.value)
                       // self.viewModel2.fetchUser()
                    }
                
            }
        }
    }
}


