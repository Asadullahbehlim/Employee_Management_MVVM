//
//  EmptyView.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 04/05/22.
//

import SwiftUI

struct EmptyView: View {
    // MARK: - property
    @State private var showingAddEmployeeView:Bool = false
    
    @State private var animatingButton: Bool = false
        
    // MARK: - Body
    
    var body: some View {
        
    NavigationView {
     ZStack {
         VStack(alignment: .center, spacing: 20) {
             Spacer()
                    Text("Add Your Data Here")
                          .layoutPriority(1)
                            .font(.system(.title, design: .rounded))
             Spacer()
                } //Vstack
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
           
     } // Zstack
            
    } // Navigation View
    } // Body
    } // Struct
struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
          //  .preferredColorScheme(.dark)
    }
}

