//
//  SmallAddButton.swift
//  ToDoList
//
//  Created by Anmol  Jandaur on 12/24/21.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color.purple)
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 50)
    }
      
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
