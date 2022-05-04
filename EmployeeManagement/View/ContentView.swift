//
//  ContentView.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 03/05/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

@Environment(\.managedObjectContext) var managedObjectContext

@FetchRequest(entity: Employee.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Employee.name, ascending: true)]) var employees: FetchedResults<Employee>
    
@State private var showingAddEmployeeView:Bool = false
    
var body: some View {
    
    NavigationView{
        ZStack {
            List{
              ForEach(self.employees,id:\.self){item in
                  HStack{
                  Text(item.name ?? "Unknown")
                  
                  Spacer()
                      
                  }
              }.onDelete(perform: deleteEmployee)
         }
          .navigationBarItems(leading: EditButton() ,trailing:
              Button{
                  showingAddEmployeeView.toggle()
              } label: {
                  Image(systemName:"plus")
              }
              .sheet(isPresented:$showingAddEmployeeView){
                  AddEmployeeView().environment(\.managedObjectContext,self.managedObjectContext)
              }
          )
         .navigationTitle("Employee")
     .navigationBarTitleDisplayMode(.inline)
        }// zstack
  }
}
    
// MARK: - funtions

private func deleteEmployee(at offsets:IndexSet){
    for index in offsets{
        let employee = employees[index]
        managedObjectContext.delete(employee)
        do{
            try self.managedObjectContext.save()
        }
        catch{
            print(error)
        }
    }
}

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
