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
    @ObservedObject var mapController = MapController()
    @ObservedObject var model =  LocationManger()
    @State private var selectedPlace: Sources?
    @ObservedObject var mapViewModel = LocationMapViewModel()
    @ObservedObject var userlocation = UserLocation()
    @StateObject var viewModel = BookViewModel()
    @EnvironmentObject var viewModel2: CreateAccount
    @State  var isPresenting = false
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
        var body: some View {
            NavigationView {
                ZStack(alignment: .bottomTrailing) {
                    Map(coordinateRegion: $mapController.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: mapViewModel.source) { location in
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
                    VStack {
                        Button {
                            print("overlay")
                            isPresenting.toggle()
                        } label: {
                            Image(systemName: "gearshape.circle.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                        .padding(.leading, 30)
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
                        .padding(.leading, 30)
                    }
                    .padding(.top, 50)
                }
                .ignoresSafeArea(.all, edges: .top)
                }
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
