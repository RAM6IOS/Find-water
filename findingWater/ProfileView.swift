//
//  ProfileView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 19/3/2023.
//

import SwiftUI

struct ProfileView: View {
    @State var Firestname:String = ""
    @State var lastname:String = ""
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                    .frame(height: 40)
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: .infinity ,height: 250)
                            .foregroundColor(Color(.secondarySystemBackground))
                        VStack(alignment: .center){
                            ZStack{
                                Image("default-avatar")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100 , height: 100)
                                    .clipShape(Circle())
                                    .padding(.horizontal)
                                    .offset(y:-35)
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 17, height: 17)
                                    .foregroundColor(.black)
                                    .offset( x:20,y: 9)
                            }
                            TextField("FirstName", text: $Firestname)
                                .font(.system(size: 32, weight: .bold))
                                .lineLimit(1)
                                .minimumScaleFactor(0.75)
                                .padding()
                            TextField("LastName", text: $lastname)
                                .font(.system(size: 32, weight: .bold))
                                .lineLimit(1)
                                .minimumScaleFactor(0.75)
                                .padding(.vertical)
                                .padding(.horizontal)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                Spacer()
                Button{
                }label: {
                    Text("Save Profile")
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(width: 350,height: 40)
                .background(.blue)
                .cornerRadius(10)
                .padding(.vertical)
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
