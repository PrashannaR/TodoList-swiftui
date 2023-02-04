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
    let id: String = UUID().uuidString
}
