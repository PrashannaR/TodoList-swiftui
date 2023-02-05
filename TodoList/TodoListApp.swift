//
//  TodoListApp.swift
//  TodoList
//
//  Created by Prashanna Rajbhandari on 04/02/2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
            
            
        }
    }
}
