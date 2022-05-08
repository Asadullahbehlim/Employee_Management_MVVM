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
           
           VStack(alignment: .leading, spacing: 70) {
                  Spacer()
                            Button (action: {
                            self.showingAddEmployeeView.toggle()
                            }) {
                            Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 54, height: 54, alignment: .center)
                        }
                        .sheet(isPresented:$showingAddEmployeeView)
                        {
                          AddEmployeeView()
                        }
                    } //Vstack
                        .padding(.bottom, 80)
                        .padding(.leading, 290)
       
     } // Zstack
            
    } // Navigation View
    } // Body
    } // Struct
struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}


// Alternate Try
//        VStack(alignment: .center, spacing: 20) {
//
//        Text("Add Your Data Here")
//              //  .layoutPriority(1)
//                .font(.system(.title, design: .rounded))
//    } //Vstack
//        .padding(.horizontal)
//     ZStack {
//       // VStack(alignment: .center, spacing: 70)
//
//                Button (action: {
//                self.showingAddEmployeeView.toggle()
//                }) {
//                Image(systemName: "plus.circle.fill")
//                    .resizable()
//                   .scaledToFit()
//                   .frame(width: 48, height: 48, alignment: .center)
//            }
//            .sheet(isPresented:$showingAddEmployeeView)
//            {
//              AddEmployeeView()
//            }
//        } //Vstack
//            .padding(.bottom, 15)
//            .padding(.trailing, 15)
//     //  )
       
