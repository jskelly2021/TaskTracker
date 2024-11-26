//
//  Day+CoreDataProperties.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/26/24.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var name: String?
    @NSManaged public var job: Job?

}

extension Day : Identifiable {

}
