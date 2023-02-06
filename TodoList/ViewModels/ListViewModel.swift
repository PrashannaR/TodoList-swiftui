//
//  ListViewModel.swift
//  TodoList
//
//  Created by Prashanna Rajbhandari on 05/02/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    //MARK: Model initialization
    @Published var items : [ItemModel] = []{
        didSet{
            // didSet is a built-in function swiftUI
            // which gets executed when the data in the provided array (here: items) gets changed
            // here the code inside didSet will execute for the functions:
            //  deleteItem(), moveItems(), addItem(), updateItem()
            
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
        //  model data
        //        let newItems = [
        //            ItemModel(title: "First Title", isCompleted: false),
        //            ItemModel(title: "Second Title", isCompleted: false),
        //            ItemModel(title: "Third Title", isCompleted: true)
        //        ]
        //
        //        items.append(contentsOf : newItems)
        
        // getting the data from the UserDefaults
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        
        self.items = savedItems
        
    }
    
    // MARK: CRUD functions
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
    
    
    // MARK: Save data locally
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            // converts items array from ItemModel array to JSON data to save into the UserDefaults
            
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
            
        }
    }
}
