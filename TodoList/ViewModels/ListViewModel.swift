//
//  ListViewModel.swift
//  TodoList
//
//  Created by Prashanna Rajbhandari on 05/02/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items : [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "First Title", isCompleted: false),
            ItemModel(title: "Second Title", isCompleted: false),
            ItemModel(title: "Third Title", isCompleted: true)
        ]
        
        items.append(contentsOf : newItems)
    }
    
    func deleteItem(index: IndexSet){
        items.remove(atOffsets: index)
    }
    
    func moveItems(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(text: String){
        let newItem = ItemModel(title: text, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex (where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
        
        
    }
}
