// AddEventFormView.swift
// GRH OTBS

import SwiftUI

struct AddEventFormView: View {
    let selectedDate: Date
    @Binding var events: [Date: [String]]
    @Environment(\.dismiss) var dismiss

    // Form States
    @State private var eventType: String = "Leave"
    @State private var subEventType: String = "Personal"
    @State private var startDate: Date
    @State private var endDate: Date

    // Options
    let eventTypes = ["Leave", "Training", "Doctor Visit"]
    let leaveCategories = ["Personal", "Sick", "Vacation"]
    let trainingTypes = ["Soft Skills", "Technical", "Leadership"]

    // Existing events for the selected date
    private var existingEvents: [String] {
        events[selectedDate.dayOnly] ?? []
    }

    init(selectedDate: Date, events: Binding<[Date: [String]]>) {
        self.selectedDate = selectedDate
        self._events = events
        // Set start and end date initially to the tapped date
        self._startDate = State(initialValue: selectedDate)
        self._endDate = State(initialValue: selectedDate)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    // Title
                    VStack(spacing: 5) {
                        Text("Add Event")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Selected Date: \(formattedDate(selectedDate))")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }

                    // Event Type Picker
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Event Type")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Picker("Event Type", selection: $eventType) {
                            ForEach(eventTypes, id: \.self) { type in
                                Text(type).tag(type)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(maxWidth: .infinity, minHeight: 45)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }

                    // Sub Event Type Picker
                    if eventType == "Leave" {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Leave Category")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Picker("Leave Category", selection: $subEventType) {
                                ForEach(leaveCategories, id: \.self) { category in
                                    Text(category).tag(category)
                                }
                            }
                            .pickerStyle(.menu)
                            .frame(maxWidth: .infinity, minHeight: 45)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                    } else if eventType == "Training" {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Training Type")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Picker("Training Type", selection: $subEventType) {
                                ForEach(trainingTypes, id: \.self) { type in
                                    Text(type).tag(type)
                                }
                            }
                            .pickerStyle(.menu)
                            .frame(maxWidth: .infinity, minHeight: 45)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                    }

                    // Date Range Pickers
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Select Date Range")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.horizontal)

                        HStack(spacing: 15) {
                            DatePicker("Start", selection: $startDate, displayedComponents: [.date])
                                .datePickerStyle(.compact)
                                .frame(maxWidth: .infinity, minHeight: 45)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)

                            DatePicker("End", selection: $endDate, displayedComponents: [.date])
                                .datePickerStyle(.compact)
                                .frame(maxWidth: .infinity, minHeight: 45)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)

                        // Existing events display
                        if !existingEvents.isEmpty {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Existing Events")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                ForEach(existingEvents, id: \.self) { event in
                                    Text("• \(event)")
                                        .padding(.vertical, 2)
                                        .padding(.horizontal, 5)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(6)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // Save Button
                    Button(action: {
                        saveEvent()
                        dismiss()
                    }) {
                        Text("Save Event")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("New Event")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Save Function
    func saveEvent() {
        var current = startDate.dayOnly
        let finalDate = endDate.dayOnly
        while current <= finalDate {
            let fullEventName = subEventType.isEmpty ? eventType : "\(eventType) - \(subEventType)"
            events[current, default: []].append(fullEventName)
            current = Calendar.current.date(byAdding: .day, value: 1, to: current)!
        }
        print("Saved event: \(eventType) - \(subEventType) from \(startDate) to \(endDate)")
    }

    // Format date
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}


