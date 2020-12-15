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
}
