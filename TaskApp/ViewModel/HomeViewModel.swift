//
//  HomeViewModel.swift
//  TaskApp
//
//  Created by badar on 15/12/20.
//

import SwiftUI

class HomeViewModel : ObservableObject {
    
    @Published var content = ""
    @Published var date = Date()
    
    // For NewData Sheet...
    @Published var isNewData = false
    
    // Checking & Updating Date....
    
    let calender = Calendar.current
    
    func checkDate() -> String {
        
        if calender.isDateInToday(date) {
            
             return "Hari Ini"
        }
        else if calender.isDateInTomorrow(date) {
            
            return "Besok"
        }
        else {
            return "Other day"
        }
    }
    
    func updateDate(value : String) {
        
        if value == "Hari Ini" {date = Date()}
        else if value == "Besok" {
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        }
        else {
            // Lakukan Sesuatu...
            
        }
    }
}
