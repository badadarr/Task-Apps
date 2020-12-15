//
//  Home.swift
//  TaskApp
//
//  Created by badar on 15/12/20.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        
        Button(action: {}, label: {
            Text("Button")
        })
        .sheet(isPresented: $homeData.isNewData, content: {
            
            
        })
    }
}
