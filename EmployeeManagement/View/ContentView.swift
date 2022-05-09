//
//  ContentView.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 03/05/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

    // MARK: - Property
@Environment(\.managedObjectContext) var managedObjectContext

@FetchRequest(entity: Employee.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Employee.name, ascending: true)]) var employees: FetchedResults<Employee>
    
@State private var showingAddEmployeeView:Bool = false
    
   // MARK: - Body
var body: some View {
    
    NavigationView{
        ZStack {
            List{
              ForEach(self.employees,id:\.self){item in
                  HStack{
                    Circle()
                   .foregroundColor(.green)
                    .frame(width: 12, height: 12, alignment: .center)
                    Text(item.name ?? "Unknown")
                          .fontWeight(.bold)
                  
                  Spacer()
                      
                  } //Hstack End
                  .padding(.vertical, 10)
              }.onDelete(perform: deleteEmployee)
         } // List
            
          .navigationBarItems(leading: EditButton() ,trailing:
              Button{
                  showingAddEmployeeView.toggle()
              } label: {
                  Image(systemName:"plus")
              } // Label
              .sheet(isPresented:$showingAddEmployeeView){
                  AddEmployeeView().environment(\.managedObjectContext,self.managedObjectContext)
              } // sheet
          ) // Navig Bar Items
         .navigationTitle("Employee")
        .navigationBarTitleDisplayMode(.inline)
            if employees.count == 0 {
            EmptyView()
            }
        }// zstack
    
    } // Navigation View
}// Body

    
// MARK: - funtions

private func deleteEmployee(at offsets:IndexSet){
    for index in offsets{
        let employee = employees[index]
        managedObjectContext.delete(employee)
        do{
            try self.managedObjectContext.save()
        } // do
        catch{
            print(error)
        } // catch
    } // For
} // Function

} // Struct
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
