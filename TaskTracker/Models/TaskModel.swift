//
//  TaskModel.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import Foundation

enum LoadError: Error {
    case BundleError
    case LoadingError
    case DecorderError
}

let jsonString = 
"""
    {
        "name" : "Oil Change",
        "status" : "Tri Monthly",
        "details" : "Full Synthetic",
        "deadline" : "TODO",
        "group" : "Automotive",
        "priority" : false
    }
"""

class TaskModel : ObservableObject {
    var tasks: [Task] = loadTasks(jsonFile: "tasks.json")

    func addTask(task: Task) {
        
    }

    func removeTask(task: Task) {

    }

}


func loadTasks<T: Decodable>(jsonFile: String) -> T
{
//    let decoder = JSONDecoder()
//
//    do {
//        guard let fileURL = Bundle.main.url(forResource: jsonFile, withExtension: nil)
//        else {
//            throw LoadError.BundleError
//        }
//
////        guard let data = try? Data(contentsOf: fileURL)
////        else {
////            throw LoadError.LoadingError
////        }
//        
//        let data = jsonString.data(using: .utf8)!
//
//        return try decoder.decode(T.self, from: data)
//    }
//    catch LoadError.BundleError {
//        print("Couldn't find file in Bundle")
//    }
//    catch LoadError.LoadingError {
//        print("Couldn't load data from file")
//    }
//    catch LoadError.DecorderError {
//        print("Couldn't decode JSON")
//    }
//    catch {
//        print("error loading")
//    }

//    guard let file = Bundle.main.url(forResource: jsonFile, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(jsonFile) in main bundle.")
//    }

//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(jsonFile) from main bundle:\n\(error)")
//    }

    
    let data = jsonString.data(using: .utf8)!
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(jsonFile) as \(T.self):\n\(error)")
    }
    
}
