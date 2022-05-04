//
//  Employee+CoreDataProperties.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 03/05/22.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var mobileno: String?
    @NSManaged public var email: String?

}

extension Employee : Identifiable {

}
