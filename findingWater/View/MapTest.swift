//
//  MapTest.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 26/4/2023.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI
import FirebaseFirestoreSwift
import Firebase
import FirebaseAuth

struct MapTest: View {
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
    @StateObject var viewModel = BookViewModel()
    @EnvironmentObject var viewModel2 : CreateAccount
    @State  var value:Bool = false
    var body: some View {
       
            NavigationView{
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        Button{
                            if viewModel2.userSession != nil  {
                                 viewModel.createRestaurant()
                                 viewModel2.currentUser?.value.toggle()
                                 viewModel2.editProducti(id: viewModel2.currentUser?.id  ?? "reewwedsewd", value: viewModel2.currentUser?.value ?? true)
                             }
                        } label: {
                            Image(systemName: "plus")
                               // .foregroundColor(.white)
                                .padding()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 1))
                                //.shadow(color: .black, radius: 5/, x: 0, y: 0)
                        }
                        .disabled( viewModel2.currentUser?.value == true)
                        ForEach(viewModel.location, id: \.self) { item in
                           
                                Button{
                                    if viewModel2.userSession != nil &&   viewModel2.currentUser?.value == true {
                                        guard (Auth.auth().currentUser?.uid) != nil else { return }
                                        
                                        viewModel2.currentUser?.value.toggle()
                                        
                                        viewModel.excluirDaAgenda(documento: item.id ?? "brecdbjbewdbn" )
                                        
                                        viewModel2.editProducti(id: viewModel2.currentUser?.id  ?? "reewwedsewd", value: viewModel2.currentUser?.value ?? false)
                                        
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
                }
                
                
                
                
            }
            .onAppear{
                self.viewModel.fetchData()
                self.viewModel2.fetchUser()
                viewModel2.userSession
                
                var name = viewModel2.currentUser?.name
                print(name)
               
                print(viewModel2.currentUser?.value )
            }
            
            .toolbar {
                
                ToolbarItemGroup(placement: .bottomBar) {
                    
                        Button("First") {
                           if viewModel2.userSession != nil  {
                                viewModel.createRestaurant()
                                viewModel2.currentUser?.value.toggle()
                                viewModel2.editProducti(id: viewModel2.currentUser?.id  ?? "reewwedsewd", value: viewModel2.currentUser?.value ?? true)
                            }
                        }
                        .disabled( viewModel2.currentUser?.value == true)
                    
                    
                    
                    Button("Second") {
                        withAnimation{
                            viewModel2.logout()
                            viewModel2.fetchUser()
                        }
                    }
                }
            }
            
            
            
        
    }
}

struct MapTest_Previews: PreviewProvider {
    static var previews: some View {
        MapTest()
    }
}
