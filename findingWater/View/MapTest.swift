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
    @State   var value:Bool = false
   var body: some View {
       
            NavigationView{
                
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.location, id: \.self) { item in
                                Button{
                                    self.value.toggle()
                                    //viewModel.EditProducti(id: user.id ?? "JK3REWDCM", value: value)
                                    viewModel.excluirDaAgenda(documento: item.id ?? "eqwdwd")
                                } label: {
                                    Image(systemName: "bolt.fill")
                                           .foregroundColor(.white)
                                           .padding()
                                           .background(.green)
                                           .clipShape(Circle())
                                        
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
                                Button("First") {
                                    self.value.toggle()
                                    viewModel.createRestaurant()
                                }.disabled(value == true)
                    

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
