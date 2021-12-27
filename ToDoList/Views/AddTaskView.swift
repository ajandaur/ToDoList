//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Anmol  Jandaur on 12/24/21.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @Environment(\.dismiss) var dismissSheet
    
    @State private var title: String = ""
    
    @State var alertTitle:  String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a new task")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task here", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if textIsValid() {
                    realmManager.addTask(taskTitle: title)
                }
                dismissSheet()
            } label: {
                // label
                Text("Add task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.purple)
                    .cornerRadius(30)
            }
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 1.086, saturation: 0.2141, brightness: 0.9))
        
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func textIsValid() -> Bool {
        if title.count < 3 {
            alertTitle = "Your task must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
      
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
