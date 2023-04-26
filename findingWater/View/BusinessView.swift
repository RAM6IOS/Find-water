//
//  BusinessView.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 25/4/2023.
//

import SwiftUI

struct BusinessView: View {
    //@ObservableObject var mMapController : MapController
    @ObservedObject var mapController = MapController()
    var body: some View {
        VStack{
            HStack(alignment:.top){
                VStack(alignment: .leading){
                    Text(mapController.selectedBusinessName)
                        .font(.title)
                    Text(mapController.selectedBusinessplacemark)
                    
                }
                Spacer()
                
                Button{
                    mapController.isBusinessViewShowing.toggle()
                } label: {
                    Image(systemName: "mark.circle.fill")
                }
               
                
            }
            HStack{
                ForEach(mapController.actions){ action in
                    VStack{
                        Button{
                            action.hadler()
                        } label: {
                            VStack{
                                Image(systemName: action.image)
                                Text(action.title)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                    
                }
            }
            
            
        }
        .padding()
    }
}
/*
struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView(mMapController: MapController())
            .previewLayout(.sizeThatFits)
    }
}
*/
