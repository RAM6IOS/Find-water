//
//  LocationList Details.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 21/3/2023.

import SwiftUI
struct LocationListDetails: View {
    @State private var showingDetail = false
    @Environment(\.dismiss) private var dismiss
    @State private var isPresented = false

    var body: some View {
            Button("Show Sheet") {
                isPresented.toggle()
                    }
            .fullScreenCover(isPresented: $isPresented, content: DismissingView1.init)
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

