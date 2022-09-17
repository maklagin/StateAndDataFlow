//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    
    @State private var showAlert = false
    
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
            VStack {
                HStack {
                    UserNameTextField(name: $name, showAlert: $showAlert)
                } .padding()
                
                okButton(name: $name, showAlert: $showAlert, user: user)
            } .padding()
            .background(Color(.systemGray5))
            .cornerRadius(20)
    }
}

private struct UserNameTextField: View {
    @Binding var name: String
    @Binding var showAlert: Bool
    
    var body: some View {
        TextField("Enter your name", text: $name)
            .multilineTextAlignment(.center)
            .textFieldStyle(.roundedBorder)
            .cornerRadius(20)
            .alert("Invalid User name", isPresented: $showAlert, actions: {}) {
                Text("Please, enter more than 2 characters")
            }
        if name.count <= 2 {
            Text(name.count.formatted()).foregroundColor(.red)
        } else {
            Text(name.count.formatted()).foregroundColor(.green)
        }
    }
}

struct okButton: View {
    @Binding var name: String
    @Binding var showAlert: Bool
    @ObservedObject var user: UserManager
    
    var body: some View {
        Button(action: registerUser)
        {
            if name.count <= 2 {
                Image(systemName: "checkmark.circle").foregroundColor(.gray)
                Text("OK").foregroundColor(.gray)
            } else {
                Image(systemName: "checkmark.circle").foregroundColor(.blue)
                Text("OK").foregroundColor(.blue)
            }
        }
    }
    
    private func registerUser() {
        if name.count <= 2 {
            name = ""
            showAlert = true
        } else {
            user.name = name
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

