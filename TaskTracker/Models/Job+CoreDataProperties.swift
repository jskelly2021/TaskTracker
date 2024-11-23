//
//  Job+CoreDataProperties.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/21/24.
//
//

import Foundation
import CoreData


extension Job {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Job> {
        return NSFetchRequest<Job>(entityName: "Job")
    }

    @NSManaged public var deadline: Date?
    @NSManaged public var details: String?
    @NSManaged public var status: Bool
    @NSManaged public var title: String?
    @NSManaged public var timeScale: Int

}

extension Job : Identifiable {

}
