//
//  DateButton.swift
//  TaskApp
//
//  Created by badar on 15/12/20.
//

import SwiftUI

struct DateButton: View {
    var title : String
    @ObservedObject var homeData : HomeViewModel
    
    var body: some View {
        
        Button(action: {}, label: {
            
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
        })
    } 
}
