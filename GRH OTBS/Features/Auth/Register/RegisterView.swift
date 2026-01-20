//
//  Untitled.swift
//  GRH OTBS
//
//  Created by Wael on 19/1/2026.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Register")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Register") {
                // placeholder for register
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
