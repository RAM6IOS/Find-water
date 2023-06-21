//
//  Action .swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/4/2023.
//

import Foundation

struct Action: Identifiable {
   var id = UUID()
    var title: String
    var image: String
    var hadler: () ->Void
}
