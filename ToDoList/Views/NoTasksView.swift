//
//  NoTasksView.swift
//  ToDoList
//
//  Created by Anmol  Jandaur on 12/27/21.
//

import SwiftUI

struct NoTasksView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            Text("There are no current tasks!")
                .font(.title)
                .fontWeight(.semibold)
            Text("Let's get productive! Click the add button at the bottom right to add some tasks to your list.")
           
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut) {
                animate.toggle()
            }
        }
    }
}

struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NoTasksView()
    }
}
