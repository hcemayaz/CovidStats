//
//  CovidFetchRequest.swift
//  CovidStats
//
//  Created by cemayaz on 6.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidFetchRequest: ObservableObject{
    
    @Published var allCountries: [CountryData] = []
    @Published var totalData: TotalData =  testTotalData
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",

        "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
    ]
    
    init() {
        
        getCurrentTotal()
        getAllCountries()
        
    }
    
    func getCurrentTotal() {
        
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil{
                let json = JSON(result!)
                //print(json )
                
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                let recovered = json[0]["recovered"].intValue
                let critital = json[0]["critital"].intValue
                
                self.totalData = TotalData(confirmed: confirmed, critical: critital, deaths: deaths, recovered: recovered)
            }
            else{
                self.totalData = testTotalData
            }
        }
        
        //        AF.request("https://covid-19-data.p.rapidapi.com/totals", headers: headers).responseDecodable(of: DecodableType.self) { response in
        //            debugPrint(response)
        //        }
        
        
        
    }
    
    
    
    func getAllCountries() {
        
        
        AF.request("https://covid-19-data.p.rapidapi.com/country/all", headers: headers).responseJSON { response in
            
            let result = response.value
            
            if result != nil{
                
                let dataDictionary = result as! [Dictionary<String, AnyObject>]
                
                for countryData in dataDictionary{
                    print(countryData)
                }
                
            }
            
            
        }
        
    }
    
}
