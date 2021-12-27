//
//  TaskView.swift
//  ToDoList
//
//  Created by Anmol  Jandaur on 12/24/21.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack {
            Text("My tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                // iterate through task array
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, isComplete: task.completed)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    realmManager.updateTask(id: task.id, completed: !task.completed)
                                }
                            }
                            .swipeActions(edge: .trailing) {
                                withAnimation(.linear) {
                                    Button(role: .destructive) {
                                        realmManager.deleteTask(id: task.id)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                                
                            }
                    }
                    
                }
                .listRowSeparator(.hidden)
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 1.086, saturation: 0.2141, brightness: 0.9))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}
