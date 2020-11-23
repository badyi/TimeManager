//
//  Event+CoreDataProperties.swift
//  TimeManager
//
//  Created by и on 23.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var completionFlag: Bool
    @NSManaged public var date: Date?
    @NSManaged public var endTime: Date?
    @NSManaged public var startTime: Date?
    @NSManaged public var text: String?
    @NSManaged public var usedTime: Int64

}
