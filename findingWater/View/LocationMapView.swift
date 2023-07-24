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
import Firebase
import FirebaseFirestoreSwift

struct LocationMapView: View {
    @ObservedObject var model =  LocationManger()
    @ObservedObject var mapViewModel = LocationMapViewModel()
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
        var body: some View {
            NavigationView {
                ZStack(alignment: .bottomTrailing) {
                    Map(coordinateRegion: $model.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: mapViewModel.source) { location in
                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.location.latitude,
                                                                         longitude: location.location.longitude)) {
                            NavigationLink(destination: LocationDitels(soures: location)) {
                                Image("water")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 44, height: 44)
                            }
                        }
                    }
                    LocationMapComponat(isPresenting: $model.isPresenting)
                }
                .ignoresSafeArea(.all)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            }
    func openMap(coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
    }
        }

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}
