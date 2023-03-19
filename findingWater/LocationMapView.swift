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

struct LocationMapView: View {
   @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916 ,longitude: 3.108917), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .ignoresSafeArea(.all, edges: .top)
                
        }
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}
