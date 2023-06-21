//
//  LocationListView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 19/3/2023.
//

import SwiftUI

struct LocationListView: View {
    @ObservedObject var  locationListVM = LocationListViewModel()
    @State var showshet:Bool = false
    var body: some View {
        NavigationView {
            List(locationListVM.location) { user in
                HStack(spacing:15) {
                    Image("default-avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70 ,height: 70)
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Text("name:\(user.name)")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Volume: \(user.tankVolume)")
                    }
                }
                .onLongPressGesture(minimumDuration: 2) {
                    showshet.toggle()
                }
                .sheet(isPresented: $showshet) {
                    if #available(iOS 16.0, *) {
                        VStack(alignment: .leading ) {
                            HStack(spacing: 20) {
                                Image("default-avatar")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70 ,height: 70)
                                    .cornerRadius(20)
                                VStack(alignment: .leading ,spacing: 15) {
                                    Text("name: \(user.name)")
                                        .font(.title3)
                                    Text("Volume:\(user.tankVolume)")
                                    Text("Truck:\(user.vehicleModel) / \(user.vehicleNumber)")
                                    // Text(Phone:\(user.))
                                    Button(action: {
                                        guard let phoneNumber = URL(string: "tel://1234567890") else { return }
                                        UIApplication.shared.open(phoneNumber)
                                    }) {
                                        HStack( spacing: 10) {
                                            Image("phone-call")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 20 ,height: 20)
                                            Text("Call")
                                                .foregroundColor(.white)
                                        }
                                        .foregroundColor(.white)
                                        .frame(width: 100 ,height: 40)
                                        .background(.green)
                                        .cornerRadius(5)
                                        .shadow(radius: 15)
                                    }
                                }
                                Spacer()
                            }
                            .padding()
                        }
                       // .padding()
                        .presentationDetents([.height(200)])
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            .listStyle(.grouped)
            .onAppear{
                self.locationListVM.fetchData()
            }
            .navigationTitle("Tank truck")
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
