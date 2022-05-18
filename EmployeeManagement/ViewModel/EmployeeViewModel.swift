//
//  EmployeeViewModel.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 18/05/22.
//

import Foundation
import CoreData
import SwiftUI

class EmployeeViewModel: ObservableObject {
    
    
    public static let shared = EmployeeViewModel()
    @Published  var name: String = ""
    @Published  var email: String = ""
    @Published  var mobileno: String = ""
    @Published var employees:[Employee] = []

    
    func getAllEmployees() {
        employees = PersistenceController.shared.getAllEmployees()

    }
    
    
    func save() {
        
        let employee = Employee(context:PersistenceController.shared.viewContext)
    employee.name = name
    employee.mobileno = mobileno
    employee.email = email
        PersistenceController.shared.save()
    }
    // MARK: - Delete function

        func delete(_ employee:Employee){
        let existingEmployee = PersistenceController.shared.getEmployeeById(id:employee.objectID)
        if let existingEmployee = existingEmployee{
        PersistenceController.shared.deleteEmployee(employee: existingEmployee)
        }
        
//
//        PersistenceController.shared.save() {
//
//        func save() {
//    do{
//    try viewContext.save()
//    }
//    catch{
//        viewContext.rollback()
//
//    print(error)
//
//    }
//    }
//}
}
}
