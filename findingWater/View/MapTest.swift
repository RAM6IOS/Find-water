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

struct DocData: Identifiable, Decodable ,Hashable  {
    @DocumentID var id: String?
    let  name : String
    let dateAdded: Timestamp
    let address : String
    let value : Bool
}

struct MapTest: View {
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
    @StateObject var viewModel = BookViewModel()
    @EnvironmentObject var viewModel2 : CreateAccount
    @State   var value:Bool = false
    var body: some View {
        
        NavigationView{
          

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.location, id: \.self) { item in
                            if viewModel2.userSession != nil {
                                Button{
                                    
                                    guard let uid = Auth.auth().currentUser?.uid else { return }
                                    
                                    self.value.toggle()
                                    //viewModel.EditProducti(id: user.id ?? "JK3REWDCM", value: value)
                                    viewModel.excluirDaAgenda(documento: item.id ?? "brecdbjbewdbn" )
                                    
                                    
                                } label: {
                                    Image(systemName: "bolt.fill")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(.green)
                                        .clipShape(Circle())
                                    
                                }
                            } else {
                                
                                Button{
                                    
                                    
                                    
                                }label: {
                                    Image(systemName: "bolt.fill")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(.red)
                                        .clipShape(Circle())
                                }
                            }
                            
                            
                            
                            
                            
                            
                        }
                        
                    }
                }
                
               
            
            
        }
        .onAppear{
            self.viewModel.fetchData()
            self.viewModel2.fetchUser()
            viewModel2.userSession
            print(viewModel2.userSession)
        }
       
            .toolbar {
            
            ToolbarItemGroup(placement: .bottomBar) {
                
                    Button("First") {
                        self.value.toggle()
                        viewModel.createRestaurant()
                    }
                    
                
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
