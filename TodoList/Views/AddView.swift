//
//  AddView.swift
//  TodoList
//
//  Created by Prashanna Rajbhandari on 04/02/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel : ListViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertTitle: String = ""
    @State var showAlert : Bool = false
    
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
                    saveButtonPressed()
                    
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
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed(){
        
        if textIsAppropriate(){
            listViewModel.addItem(text: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else{
            
        }
        
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            alertTitle = "Title must be at least 3 characters long ‼️"
            showAlert.toggle()
            return false
        }else{
            return true
        }
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
