//
//  ItemModel.swift
//  TodoList
//
//  Created by Prashanna Rajbhandari on 05/02/2023.
//

import Foundation


struct ItemModel: Identifiable {
    let title: String
    let isCompleted: Bool
    let id: String
    
    init(title: String, isCompleted: Bool, id: String = UUID().uuidString) {
        self.title = title
        self.isCompleted = isCompleted
        self.id = id
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(title: title, isCompleted: !isCompleted, id: id)
    }
}
