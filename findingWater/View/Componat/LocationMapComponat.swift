//
//  LocationMapComponat.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/7/2023.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct LocationMapComponat: View {
    @Binding var isPresenting: Bool
    @ObservedObject var model =  LocationManger()
    var body: some View {
        VStack {
            Button {
                isPresenting.toggle()
            } label: {
                Image(systemName: "gearshape.circle.fill")
                    .foregroundColor(.black)
                    .font(.system(size: 40))
            }
            .fullScreenCover(isPresented: $isPresenting) {
                Settings(isPresenting: $isPresenting)
            }
            LocationButton(.currentLocation) {
                model.requesAllowOnceLocationPermission()
            }
            .foregroundColor(.white)
            .cornerRadius(8)
            .labelStyle(.iconOnly)
            .symbolVariant(.fill)
            .tint(.blue)
            .frame(width: 40)
            .clipShape(Circle())
        }
        .padding(.bottom, 100)
    }
}


