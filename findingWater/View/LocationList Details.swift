//
//  LocationList Details.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 21/3/2023.

import SwiftUI
struct LocationList_Details: View {
    @State private var showingDetail = false

    @Environment(\.dismiss) private var dismiss
    @State private var isPresented = false

    var body: some View {
        
            Button("Show Sheet") {
                isPresented.toggle()
                    }
        
            .fullScreenCover(isPresented: $isPresented, content: DismissingView1.init)

                /*
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
                 */
            
       }
        
    }



struct DismissingView1: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Dismiss Me") {
            dismiss()
        }
    }
}


