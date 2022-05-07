//
//  SettingsView.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 06/05/22.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Property
    
    // MARK: - Body
    var body: some View {
        NavigationView {
    VStack(alignment: .center, spacing: 0) {
        // MARK: - Form
        Form { ForEach(0..<5) {
            item in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      }
        } // Form
        
        Text("About The Application")
        Form {
            FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "John / Jane")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.5.0")
        }
        
        
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
        
        // MARK: - Footer
        
        Text("Copyright © All rights reserved.\nCreated By Asad")
                  .multilineTextAlignment(.center)
                  .font(.footnote)
                  .padding(.top, 6)
                  .padding(.bottom, 8)
                  .foregroundColor(Color.secondary)
    } //Vstack
      .navigationTitle("Settings")
    .navigationBarTitleDisplayMode(.inline)
    .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))

    } // Navig View
}
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
