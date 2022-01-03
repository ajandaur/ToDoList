//
//  RealmManager.swift
//  ToDoList
//
//  Created by Anmol  Jandaur on 12/25/21.
//

import SwiftUI
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening Realm: \(error)")
            
        }
    }
    
    func addTask(taskTitle: String, taskNotes: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false, "note": taskNotes])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added new task to Realm: \(newTask)")
                }
            } catch {
                print("Error adding task to RealM: \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else { return }
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task with id \(id)! Compelted status: \(completed)")
                }
            } catch {
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    
//    func updateNotes(id: ObjectId, taskTitle: String, taskNotes: String, completed: Bool) {
//        
//        if let localRealm = localRealm {
//            do {
//                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
//                guard !taskToUpdate.isEmpty else { return }
//                
//                try localRealm.write {
//                    taskToUpdate[0].note = taskNotes
//                    getTasks()
//                    print("Updated task with id \(id)! task note now says \(taskNotes)")
//                }
//                    
//                } catch {
//                    print("Error updating task \(id)'s notes section")
//                }
//            }
//        }
        
        func deleteTask(id: ObjectId) {
            if let localRealm = localRealm {
                do {
                    let tasktoDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                    guard !tasktoDelete.isEmpty else { return }
                    
                    try localRealm.write {
                        localRealm.delete(tasktoDelete)
                        getTasks()
                        print("Deleted task with id \(id)")
                    }
                } catch {
                    print("Error deleting task \(id) to Realm: \(error)")
                }
            }
        }
    }
