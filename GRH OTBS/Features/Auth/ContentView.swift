//
//  ContentView.swift
//  GRH OTBS
//
//  Created by Wael on 16/1/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                NavigationLink("Login", destination: LoginView())
                NavigationLink("Register", destination: RegisterView())
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
