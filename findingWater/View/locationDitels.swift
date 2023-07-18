//
//  locationDitels.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 15/6/2023.
//
import SwiftUI
import FirebaseFirestoreSwift
import Firebase
import FirebaseAuth
import CoreLocation
import CoreLocationUI
import MapKit

struct LocationDitels: View {
    var soures: Sources
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
        ]
    @ObservedObject var createAccountVM = CreateAccount()
    @ObservedObject var userAtTheWaterSourceVM = UserAtTheWaterSourceVM()
    var body: some View {
        VStack(alignment: .leading) {
            Image("caption")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: nil
                               , idealHeight: nil, maxHeight: 300, alignment: .center )
            .clipped()
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(soures.name)
                        .font(.title)
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Algeria ,Blida ,ouled slama")
                    }
                    .font(.title3)
                    Text("Coordinate:")
                        .font(.title3)
                    Text("latitude:\(soures.location.latitude)")
                    Text("latitude:\(soures.location.longitude)")
                    Button {
                        openMap(coordinate: CLLocationCoordinate2D(latitude: soures.location.latitude
                                                                 , longitude: soures.location.longitude))
                    }label: {
                        HStack {
                            Text("Get Directions")
                            Image(systemName: "arrow.forward")
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                        .background(Color.blue)
                    }
                    .cornerRadius(25)
                }
                .padding()
                .padding(.horizontal)
                VStack {
                    Text("People on Site:")
                        .font(.title3)
                        .bold()
                    LazyVGrid(columns: columns, spacing: 20) {
                        Button {
                            if createAccountVM.userSession != nil {
                                createAccountVM.currentUser?.value.toggle()
                                userAtTheWaterSourceVM.createNewReservation(mdel: soures.name)
                                createAccountVM.editProducti(id: createAccountVM.currentUser?.id  ?? "reewwedsewd"
                                                             , value: createAccountVM.currentUser?.value ?? true)
                            }
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 1))
                        }
                        .disabled( createAccountVM.currentUser?.value == true)
                        ForEach(userAtTheWaterSourceVM.user, id: \.self) { item in
                            Button {
                                if createAccountVM.userSession != nil &&   createAccountVM.currentUser?.value == true {
                                    createAccountVM.currentUser?.value.toggle()
                                    userAtTheWaterSourceVM.rmoveUser(id: item.id ?? "eereded", user: soures.name)
                                    createAccountVM.editProducti(id: createAccountVM.currentUser?.id  ?? "reewwedsewd"
                                                    , value: createAccountVM.currentUser?.value ?? false )
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
                    .onAppear {
                        userAtTheWaterSourceVM.userInWaterLocation(mdel: soures.name)
                        self.createAccountVM.fetchUser()
                    }
                }
                .padding()
            }
        }
        }
        .navigationTitle(soures.name)
    }
    // This function will  open Map To determine the direction and distance to the water source
    func openMap(coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
    }
}
