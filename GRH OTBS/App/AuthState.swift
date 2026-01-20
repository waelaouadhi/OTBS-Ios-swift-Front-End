

import SwiftUI
import Combine

class AuthState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func login(email: String, password: String) {
        // Bypass login: always succeed
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
    }
}
