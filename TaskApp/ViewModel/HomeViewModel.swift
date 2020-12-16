//
//  HomeViewModel.swift
//  TaskApp
//
//  Created by badar on 15/12/20.
//

import SwiftUI
import CoreData

class HomeViewModel : ObservableObject {
    
    @Published var content = ""
    @Published var date = Date()
    
    // For NewData Sheet...
    @Published var isNewData = false
    
    // Checking & Updating Date....
    // Storing update...
    @Published var updateItem : Task!
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
    
    func writeData(context : NSManagedObjectContext) {
        
        // Updating Item...
        
        if updateItem != nil {
            
            // Means Update Old Data...
            updateItem.date = date
            updateItem.content = content
            try! context.save()
            
            // removing updating if successfull...
            updateItem = nil
            content = ""
            date = Date()
            isNewData.toggle()
             return
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        // Penyimpanan Data...
        
        do {
            try context.save()
            // success means closing view...
            isNewData.toggle()
            content = ""
            date = Date()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func EditItem(item : Task) {
        
        updateItem = item
        // togging the newData...
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
}
