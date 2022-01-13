//
//  ContentView.swift
//  CovidStats
//
//  Created by cemayaz on 6.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    var body: some View {
        Text("\(covidFetch.totalData.confirmed)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
