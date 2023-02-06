//
//  NoItemsView.swift
//  TodoList
//
//  Created by Prashanna Rajbhandari on 07/02/2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("secondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Text("There are no items ☹️")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Press on the add button to add your ToDos")
                
                NavigationLink(destination: AddView()) {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding()
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: 10
                    
                )
                
                
            }
            .frame(maxWidth: 400)
            .padding(40)
            .onAppear {
                addAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        
        guard !animate else {return} //makes sure the animation does not run twice
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        })
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
        .environmentObject(ListViewModel())
    }
}
