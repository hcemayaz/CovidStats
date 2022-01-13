//
//  Model.swift
//  CovidStats
//
//  Created by cemayaz on 6.10.2021.
//

import Foundation

struct TotalData {
    
    let confirmed: Int
    let critical: Int
    let deaths: Int
//    let lastChange: String
//    let lastUpdate: String
    let recovered: Int
    
    var fatalityRate: Double{
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveredRate: Double{
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

struct CountryData {
    
    let country: String
    let code: String
    let confirmed: Int64
    let recovered: Int64
    let critical: Int64
    let deaths: Int64
    let longitude: Double
    let latitude: Double
//    let lastChange: String
//    let lastUpdate: String
    
    
    var fatalityRate: Double{
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveredRate: Double{
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

let testTotalData = TotalData(confirmed: 200, critical: 100, deaths: 20, recovered: 50)
let testCountryData  = CountryData(country: "Test", code: "ts", confirmed: 500, recovered: 300, critical: 200, deaths: 100, longitude: 0.0, latitude: 0.0)
