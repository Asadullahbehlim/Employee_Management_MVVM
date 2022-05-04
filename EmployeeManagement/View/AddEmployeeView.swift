//
//  AddEmployeeView.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 03/05/22.
//

import SwiftUI

struct AddEmployeeView: View {
    
    // MARK: - Property
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var gender: String = "Male"

    @State private var mobileno: String = ""


     let genders = ["Male", "Female"]
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    

    // MARK: - Body

        var body: some View {
            NavigationView {
                VStack {
                    Form {
                        // MARK: - Emp Name
                        TextField("Employee Name", text: $name)
                            .keyboardType(.phonePad)
                        
                        // MARK: - gender
                    
                        Picker("Gender",selection: $gender) {
                            ForEach(genders, id: \.self)
                            {
                                Text($0)
                            }
                        }.pickerStyle(.segmented)

                        
                        // MARK: - Mobile
                         TextField("Mobile no.", text: $mobileno)
                            .keyboardType(.numberPad)

                        // MARK: - Email
                         TextField("Employee Email", text: $email)
                            .keyboardType(.emailAddress)

                        
                     // MARK: - save
                       
                        Button{
                                   if self.name != ""{
                                   
                                   if !mobileno.isValidPhone{
                                   errorShowing = true
                                   errorTitle = "Invalid Mobile Number"
                                   errorMessage = "Make sure to enter correct Mobile\nNumber for new Employee Record."
                                   return
                                   }
                                   
                                   if !email.isValidEmail{
                                   errorShowing = true
                                   errorTitle = "Invalid EmailId"
                                   errorMessage = "Make sure to enter correct Email\nId for new Employee Record."
                                   return
                                   }
                                       
                                   let employee = Employee(context:self.managedObjectContext)
                                   employee.name = self.name
                                   employee.gender = self.gender
                                   employee.mobileno = self.mobileno
                                   employee.email = self.email
                                       
                                   do{
                                   try self.managedObjectContext.save()
                                   }
                                   catch{
                                   print(error)
                                   }
                                   } else{
                                       errorShowing = true
                                       errorTitle = "Invalid Name"
                                       errorMessage = "Make sure to enter something for\nthe new Employee Record."
                                       return
                                   }
                                   self.presentationMode.wrappedValue.dismiss()
                               } label: {
                               Text("Add Employee")
                               }
                            
                    //  Spacer()
                        
                    }
                } //Vstack
                .navigationBarTitle("New Employee", displayMode: .inline)
                .navigationBarItems(trailing: Button { self.presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Image(systemName: "xmark")
                } )
            }
        }
    }


struct AddEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmployeeView()
    }
}
