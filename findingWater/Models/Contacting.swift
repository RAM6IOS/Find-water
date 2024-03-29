//
//  Contacting.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 1/7/2023.
//

import Foundation

struct Contacting {
    let noSupportText = "You need to set a mail account in order to leave a feedback"
    let contentPreText = "I would like to give you my honest feedback."
    let sendButtonText = "Give Feedback"
    let subject = "Feedback"
    var to = "ios191169@gmail.com"
    static let shared = Contacting()
    init(){
        if let file = Bundle.main.path(forResource: "Email", ofType: "txt"){
            do {
                self.to = try String(contentsOfFile: file)
            } catch let error {
                print(error)
            }
        }
    }
}
