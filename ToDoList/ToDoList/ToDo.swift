//
//  ToDo.swift
//  ToDoList
//
//  Created by Lydia Reynolds on 7/1/25.
//

import Foundation

struct ToDo: Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static let documentsDirectory =
       FileManager.default.urls(for: .documentDirectory,
       in: .userDomainMask).first!
    
    static let archiveURL =
       documentsDirectory.appendingPathComponent("toDos")
       .appendingPathExtension("plist")
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        lhs.id == rhs.id
    }
    
    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else
               {return nil}
            let propertyListDecoder = PropertyListDecoder()
            return try? propertyListDecoder.decode(Array<ToDo>.self,
               from: codedToDos)
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let toDo1 = ToDo(title: "Buy milk", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "Learn SwiftUI", isComplete: true, dueDate: Date(), notes: "Notes 2")
        let toDo3 = ToDo(title: "Go for a walk", isComplete: false, dueDate: Date(), notes: "Notes 3")
        
        return [toDo1, todo2, toDo3]
        
    }
}
