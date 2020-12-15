//
//  ContentView.swift
//  TaskApp
//
//  Created by badar on 15/12/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
    
        Text("Hello World!")
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
