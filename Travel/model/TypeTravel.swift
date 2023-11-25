//
//  TypeTravel.swift
//  Travel
//
//  Created by Felipe Dias on 25/11/23.
//

import Foundation

struct TypeTravel: Codable {
    var highlights: [Travel]?
    var offers: [Travel]?
    var international: [Travel]?
    
    static func jsonData(_ json:[String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }
    
    static func decodeJson(_ jsonData: Data) -> TypeTravel? {
            do {
                return try JSONDecoder().decode(TypeTravel.self, from: jsonData)
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
}
