//
//  TaskRow.swift
//  ToDoList
//
//  Created by Anmol  Jandaur on 12/24/21.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var isComplete: Bool
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: isComplete ? "checkmark.circle" : "circle")
            
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Do laundry", isComplete: true)
    }
}
