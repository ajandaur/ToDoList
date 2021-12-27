//
//  Task.swift
//  ToDoList
//
//  Created by Anmol  Jandaur on 12/25/21.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
