//
//  Deadline+CoreDataProperties.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/26/24.
//
//

import Foundation
import CoreData


extension Deadline {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deadline> {
        return NSFetchRequest<Deadline>(entityName: "Deadline")
    }

    @NSManaged public var date: Date?
    @NSManaged public var job: Job?

}

extension Deadline : Identifiable {

}
