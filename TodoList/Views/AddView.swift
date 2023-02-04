//
//  AddView.swift
//  TodoList
//
//  Created by Prashanna Rajbhandari on 04/02/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Something here", text: $textFieldText)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(
                        Color.gray
                            .opacity(0.3)
                    )
                    .cornerRadius(10)
                
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                }
                
            }.padding()
        }
        .navigationTitle("Add an Item 🖋️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
