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

    @State private var mobileno: String = ""
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    

    // MARK: - Body

        var body: some View {
            NavigationView {
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        // MARK: - Emp Name
                        TextField("Name", text: $name)
                            .padding()
                            .keyboardType(.phonePad)
                            .background(Color(UIColor.tertiarySystemFill))
                            .cornerRadius(12)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        

                        
                        // MARK: - Mobile
                         TextField("Mobile No.", text: $mobileno)
                            .padding()
                            .keyboardType(.numberPad)
                            .background(Color(UIColor.tertiarySystemFill))
                            .cornerRadius(12)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        
                        

                        // MARK: - Email
                         TextField("Email", text: $email)
                            .padding()
                            .keyboardType(.emailAddress)
                            .background(Color(UIColor.tertiarySystemFill))
                            .cornerRadius(12)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        

                        
                     // MARK: - save
                       
                          Button {
                                   if self.name != ""{
                                       
                                   if !mobileno.isValidPhone{
                                   errorShowing = true
                                   errorTitle = "Invalid or Incorrect Mobile Number"
                                   errorMessage = "Make sure to enter correct Mobile\nNumber for new Employee Record."
                                       
                                   return
                                   }
                                   
                                   if !email.isValidEmail{
                                   errorShowing = true
                                   errorTitle = "Invalid or Incorrect EmailId"
                                   errorMessage = "Make sure to enter correct Email\nId for new Employee Record."
                                       
                                   return
                                   }
                                       
                                   let employee = Employee(context:self.managedObjectContext)
                                   employee.name = self.name
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
                               } // Button
                    label:  {
                               Text("Add Employee")
                                 .font(.system(size: 24, weight: .bold, design: .default))
                                 .frame(minWidth: .zero, maxWidth: .infinity)
                               //  .background(.indigo)
                             
                         } // Label
                        
                        .buttonStyle(.borderedProminent)
                         .padding(.vertical)
                         .cornerRadius(12)
                            
                      Spacer()
                        
                    } // vstack
                    .padding(.horizontal)
                    .padding(.vertical, 30)
                    
                } //Vstack
                .navigationBarTitle("New Employee", displayMode: .inline)
                .navigationBarItems(trailing: Button { self.presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Image(systemName: "xmark")
                } )
                .alert(isPresented: $errorShowing) {
                    Alert(title: Text(errorTitle), message: Text (errorMessage))
                } // Alert
            } // navigation View
        } // Body
    } // Struct


struct AddEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmployeeView()
    }
}
