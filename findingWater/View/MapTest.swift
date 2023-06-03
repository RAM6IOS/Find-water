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
    @StateObject var viewModel2 = CreateAccount()
    @State   var value:Bool = false
    var body: some View {
        
        NavigationView{
            
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.location, id: \.self) { item in
                        Button{
                           
                            
                        } label: {
                            Image(systemName: "bolt.fill")
                                .foregroundColor(.white)
                                .padding()
                                .background(.green)
                                .clipShape(Circle())
                            
                        }
                        if  viewModel2.userSession != nil {
                            Button{
                               
                                    guard let uid = Auth.auth().currentUser?.uid else { return }
                                    
                                    self.value.toggle()
                                    //viewModel.EditProducti(id: user.id ?? "JK3REWDCM", value: value)
                                    viewModel.excluirDaAgenda(documento: uid )
                                
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
            
            .onAppear{
                self.viewModel.fetchData()
            }
            
        }
       
            .toolbar {
            
            ToolbarItemGroup(placement: .bottomBar) {
                if  viewModel2.userSession != nil {
                    Button("First") {
                        self.value.toggle()
                        viewModel.createRestaurant()
                    }.disabled(value == true)
                    
                }
                Button("Second") {
                    
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
