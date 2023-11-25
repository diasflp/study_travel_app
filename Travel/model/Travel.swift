//
//  Travel.swift
//  Travel
//
//  Created by Felipe Dias on 25/11/23.
//

import Foundation

struct Travel: Codable {
    var id: Int
    var title: String
    var subtitle: String
    var asset: String
    var daily: Int
    var guests: Int
    var priceWithoutDiscount: Double
    var price: Double
    var cancellation: String
    
    static func jsonToDate(_ json:[String: Any]) -> Data? {
        return try? JSONSerialization.data(
            withJSONObject: json,
            options: []
        )
    }
    
    static func decodeJson(_ jsonData: Data) -> Travel? {
        do {
            return try JSONDecoder().decode(
                Travel.self,
                from: jsonData
            )
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
