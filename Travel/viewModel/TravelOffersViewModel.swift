//
//  TravelOffersViewModel.swift
//  Travel
//
//  Created by Felipe Dias on 04/01/24.
//

import Foundation

class TravelOffersViewModel: TravelViewModel {
    var titleSeesion: String {
        return "Ofertas"
    }
    
    var type: TravelViewModelType {
        return .offers
    }
    
    var travel: [Travel]
    
    var numberOfLines: Int {
        return 1
    }
    
    init(_ travel: [Travel]) {
        self.travel = travel
    }
}
