//
//  FormRowStaticView.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 06/05/22.
//

import SwiftUI

struct FormRowStaticView: View {
    // MARK: - Property
    
    var icon: String
    var firstText: String
    var secondText: String
    
    // MARK: - Body
    var body: some View {
        HStack {
              ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                  .fill(Color.gray)
                Image(systemName: icon)
                  .foregroundColor(Color.white)
              }
              .frame(width: 36, height: 36, alignment: .center)
              
              Text(firstText).foregroundColor(Color.gray)
              Spacer()
              Text(secondText)
            }
          }
        }

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(icon: "icon", firstText: "Employeee", secondText: "Asad")
    }
}
