//
//  TravelHighlightViewModel.swift
//  Travel
//
//  Created by Felipe Dias on 25/11/23.
//

import Foundation

class TravelHighlightViewModel: TravelViewModel {
    var titleSeesion: String {
        return "Destaque"
    }
    
    var type: TravelViewModelType {
        return .highlights
    }
    
    var travel: [Travel]
    
    var numberOfLines: Int {
        return travel.count
    }
    
    init(_ travel: [Travel]) {
        self.travel = travel
    }
}
