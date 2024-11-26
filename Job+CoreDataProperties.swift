//
//  Job+CoreDataProperties.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/26/24.
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
    @NSManaged public var timeScale: Int16
    @NSManaged public var title: String?
    @NSManaged public var days: NSSet?
    @NSManaged public var deadlines: NSSet?

}

// MARK: Generated accessors for days
extension Job {

    @objc(addDaysObject:)
    @NSManaged public func addToDays(_ value: Day)

    @objc(removeDaysObject:)
    @NSManaged public func removeFromDays(_ value: Day)

    @objc(addDays:)
    @NSManaged public func addToDays(_ values: NSSet)

    @objc(removeDays:)
    @NSManaged public func removeFromDays(_ values: NSSet)

}

// MARK: Generated accessors for deadlines
extension Job {

    @objc(addDeadlinesObject:)
    @NSManaged public func addToDeadlines(_ value: Deadline)

    @objc(removeDeadlinesObject:)
    @NSManaged public func removeFromDeadlines(_ value: Deadline)

    @objc(addDeadlines:)
    @NSManaged public func addToDeadlines(_ values: NSSet)

    @objc(removeDeadlines:)
    @NSManaged public func removeFromDeadlines(_ values: NSSet)

}

extension Job : Identifiable {

}
