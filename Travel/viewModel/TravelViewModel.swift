//
//  TravelViewModel.swift
//  Travel
//
//  Created by Felipe Dias on 25/11/23.
//

import Foundation

enum TravelViewModelType: String {
    case highlights
    case offers
    case international
}

protocol TravelViewModel {
    var titleSeesion: String { get }
    var type: TravelViewModelType { get }
    var travel: [Travel] { get set }
    var numberOfLines: Int { get }
}
