//
//  ContentView.swift
//  ToDoList
//
//  Created by Anmol  Jandaur on 12/24/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if !realmManager.tasks.isEmpty {
                TaskView()
                    .environmentObject(realmManager)
            } else {
                    NoTasksView()
                    .transition(AnyTransition.opacity
                                    .animation(.easeIn))

            }
            
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
            
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(realmManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 1.086, saturation: 0.2141, brightness: 0.9))
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
