//
//  Testview.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 25/4/2023.
//

import SwiftUI

struct Testview: View {
    @ObservedObject var mapController = MapController()
    var body: some View {
        NavigationView {
            LocationMapView( mapController: mapController)
        }
        .searchable(text: $mapController.searchTern)
        .onSubmit(of: .search) {
            mapController.search()
        }
    }
}

struct Testview_Previews: PreviewProvider {
    static var previews: some View {
        Testview()
    }
}
