//
//  LogOutView.swift
//  StateAndDataFlow
//
//  Created by Максим Кулагин on 16.09.2022.
//

import SwiftUI

struct LogOutButtonView: View {
    
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        Button("LogOut") { user.isRegister = false }
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 200, height: 60)
            .background(.blue)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
    }
}

struct LogOut_Previews: PreviewProvider {
    static var previews: some View {
        LogOutButtonView()
    }
}
