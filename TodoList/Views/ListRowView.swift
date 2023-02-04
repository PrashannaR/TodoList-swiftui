//
//  ListRowView.swift
//  TodoList
//
//  Created by Prashanna Rajbhandari on 04/02/2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .gray)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical,8)
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var itemOne = ItemModel(title: "Sample One", isCompleted: false)
    static var itemTwo = ItemModel(title: "Sample Two", isCompleted: true)
    
    static var previews: some View {
        Group{
            ListRowView(item: itemOne)
            ListRowView(item: itemTwo)
        }
    }
}
