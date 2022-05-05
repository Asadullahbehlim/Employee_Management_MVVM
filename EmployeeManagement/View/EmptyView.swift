//
//  EmptyView.swift
//  EmployeeManagement
//
//  Created by Asadullah Behlim on 04/05/22.
//

import SwiftUI

struct EmptyView: View {
    // MARK: - property
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
//            Image("illustration-no1")
//                .resizable()
//                .scaledToFit()
//                .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
        Text("Add Your Data Here")
                .layoutPriority(1)
                .font(.system(.title, design: .rounded))
    } //Vstack
        .padding(.horizontal)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
          //  .preferredColorScheme(.dark)
    }
}
