//
//  EmployeeManagementApp.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 03/05/22.
//

import SwiftUI

@main
struct EmployeeManagementApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
