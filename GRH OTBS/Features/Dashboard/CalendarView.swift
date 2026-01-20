// CalendarView.swift
// GRH OTBS

import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    @Binding var selectedDate: Date?
    var events: [Date: [String]] = [:] // Bind from DashboardView
    var onDateSelected: ((Date) -> Void)? = nil

    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        
        // Appearance
        calendar.appearance.headerTitleColor = .blue
        calendar.appearance.weekdayTextColor = .darkGray
        calendar.appearance.todayColor = .systemRed
        calendar.appearance.selectionColor = .systemOrange
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.titleWeekendColor = .red
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.borderRadius = 0.5
        calendar.appearance.eventSelectionColor = .yellow

        // Gesture for week/month
        let panGesture = UIPanGestureRecognizer(target: calendar, action: #selector(FSCalendar.handleScopeGesture(_:)))
        panGesture.delegate = context.coordinator
        calendar.addGestureRecognizer(panGesture)

        // Delegate & DataSource
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator

        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {
        if let date = selectedDate {
            uiView.select(date.dayOnly)
        }
        uiView.reloadData()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource, UIGestureRecognizerDelegate {
        var parent: CalendarView

        init(_ parent: CalendarView) {
            self.parent = parent
        }

        // Date selection
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            let normalizedDate = date.dayOnly
            withAnimation(.spring()) {
                parent.selectedDate = normalizedDate
            }
            parent.onDateSelected?(normalizedDate)
            print("Selected date: \(normalizedDate)")
        }

        // Number of event dots
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            return parent.events[date.dayOnly]?.count ?? 0
        }

        // Event dot colors
        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
            guard let eventList = parent.events[date.dayOnly] else { return nil }

            return eventList.map { event in
                switch event {
                case let str where str.contains("Leave"): return UIColor.systemRed
                case let str where str.contains("Doctor Visit"): return UIColor.systemGreen
                case let str where str.contains("Training"): return UIColor.systemOrange
                default: return UIColor.systemBlue
                }
            }
        }
    }
}

// MARK: - Date Normalization
extension Date {
    var dayOnly: Date {
        Calendar.current.startOfDay(for: self)
    }
}
