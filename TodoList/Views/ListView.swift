//
//  ListView.swift
//  TodoList
//
//  Created by Prashanna Rajbhandari on 04/02/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var items : [String] = [
        "First Title",
        "Second Title",
        "Third Title"
    ]
    
    var body: some View {
        List{
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}

