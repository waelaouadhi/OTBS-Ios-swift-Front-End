//
//  DashboardView.swift
//  GRH OTBS
//
//  Updated by Wael on 19/1/2026.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab: Int = 0
    @State private var selectedDate: Date? = nil // Holds the date selected from the calendar
    @State private var showEventForm: Bool = false
    @State private var events: [Date: [String]] = [:] // Store events
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // MARK: Top Card showing leave balance
                LeaveBalanceCard()
                    .padding(.horizontal)
                // MARK: Interactive Calendar
                CalendarView(
                    selectedDate: $selectedDate,
                    events: events,                // pass current events
                    onDateSelected: { date in
                        showEventForm = true
                    }
                )
                .frame(height: 300)
                .padding(.horizontal)
                .id(events) // 🔹 Force SwiftUI to reload the Calendar when events change
                Spacer()
                
                // MARK: Bottom Navigation Bar
                BottomNavBar(selectedTab: $selectedTab)
            }
            .navigationTitle("Dashboard")
            // Open AddEventFormView as a sheet
            .sheet(isPresented: $showEventForm) {
                if let date = selectedDate {
                    AddEventFormView(selectedDate: date, events: $events)
                }
            }
        }
    }
}

// ===== Helper Function =====
func formattedDate(_ date: Date?) -> String {
    guard let date = date else { return "" }
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
}

// ===== Top Card =====
struct LeaveBalanceCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Leave Balance")
                .font(.headline)
            
            Text("12 / 20 days")
                .font(.title)
                .fontWeight(.bold)
            
            // Mini progress bar for leave usage
            ProgressView(value: 12, total: 20)
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
        }
        .padding()
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

// ===== Bottom Navigation Bar =====
struct BottomNavBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Spacer()
            NavBarButton(icon: "house.fill", title: "Home", selectedTab: $selectedTab, index: 0)
            Spacer()
            NavBarButton(icon: "person.2.fill", title: "Employees", selectedTab: $selectedTab, index: 1)
            Spacer()
            NavBarButton(icon: "calendar", title: "Training", selectedTab: $selectedTab, index: 2)
            Spacer()
            NavBarButton(icon: "bell.fill", title: "Notifications", selectedTab: $selectedTab, index: 3)
            Spacer()
        }
        .padding()
        .background(.white)
        .shadow(radius: 5)
    }
}

// ===== Individual Nav Bar Button =====
struct NavBarButton: View {
    let icon: String
    let title: String
    @Binding var selectedTab: Int
    let index: Int
    
    var body: some View {
        Button {
            selectedTab = index // Update selected tab on tap
        } label: {
            VStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(selectedTab == index ? .blue : .gray)
                Text(title)
                    .font(.caption)
                    .foregroundColor(selectedTab == index ? .blue : .gray)
            }
        }
    }
    // MARK: Helper
    func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
