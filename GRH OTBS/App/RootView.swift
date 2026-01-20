//
//  Untitled.swift
//  GRH OTBS
//
//  Created by Wael on 19/1/2026.
//

import SwiftUI

struct RootView: View {
    @StateObject var authState = AuthState()

    var body: some View {
        Group {
            if authState.isLoggedIn {
                DashboardView()
                    .environmentObject(authState)
            } else {
                LoginView()
                    .environmentObject(authState)
            }
        }
    }
}
