//
//  DecodableData.swift
//  Travel
//
//  Created by Felipe Dias on 25/11/23.
//

import Foundation

let sectionTravel: [TravelViewModel]? = load("server-response.json")

func load(_ filename: String) -> [TravelViewModel]? {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
           else { fatalError("Couldn't find \(filename) in main bundle.") }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] 
        else { fatalError("error to read json dictionary") }
        
        guard let listTravel = json["travel"] as? [String: Any] 
        else { fatalError("error to read travel list") }
        
        guard let jsonData = TypeTravel.jsonData(listTravel) else { return nil }
        let typeTravel = TypeTravel.decodeJson(jsonData)
        var listTravelViewModel: [TravelViewModel] = []
        
        for session in listTravel.keys {
            switch TravelViewModelType(rawValue: session) {
            case .highlights:
                if let highlight = typeTravel?.highlights {
                    let highlightTravel = TravelHighlightViewModel(highlight)
                    listTravelViewModel.insert(highlightTravel, at: 0)
                }
            case .offers:
                if let offers = typeTravel?.offers {
                    let offersViewModel = TravelOffersViewModel(offers)
                    listTravelViewModel.append(offersViewModel)
                }
            default:
                break
            }
        }
                
        return listTravelViewModel
    } catch {
        fatalError("Couldn't parse")
    }
}
