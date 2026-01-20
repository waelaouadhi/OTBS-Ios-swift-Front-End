# GRH OTBS iOS App

[![Swift Version](https://img.shields.io/badge/Swift-5.8-orange?style=flat-square)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-16-blue?style=flat-square)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

GRH OTBS is an iOS mobile application for managing human resources tasks, including leave tracking, training, medical visits, and calendar event management. Built with **SwiftUI** and **FSCalendar**, this app provides a smooth, modern interface for HR operations.

---

## Features

- **Authentication Flow**
  - Login & Register screens
  - Session handling and validation
- **Dashboard**
  - Calendar view with events
  - Add, edit, and track leave, training, and doctor visits
- **Calendar Integration**
  - FSCalendar for date selection
  - Colored event markers based on event type
  - Select date ranges for events
- **Event Management**
  - Add new events with categories/subcategories
  - Display saved events for selected dates
- **Responsive UI**
  - Fully built with SwiftUI
  - Adaptive layout for multiple iPhone sizes


---

## Technologies

- **Swift** / **SwiftUI**
- **FSCalendar** for interactive calendar
- **Xcode** (latest stable version recommended)
- **Git** for version control

---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/waelaouadhi/OTBS-Ios-swift-Front-End.git
	2.	Navigate to the project folder:
cd OTBS-Ios-swift-Front-End
	3.	Open the Xcode project:
open GRH\ OTBS.xcodeproj
	4.	Build and run the app on your simulator or iOS device.
Usage
	1.	Launch the app
	2.	Register or login
	3.	Access the dashboard to view the calendar
	4.	Tap a date to add an event
	5.	Select event type, category, and date range
	6.	Save the event, which will appear in the calendar with colored indicators
	7.	Tap on a date to view saved events
Contributing
1.	Fork the repository
	2.	Create a new branch:
  git checkout -b feature/YourFeature
3.	Make your changes
	4.	Commit your changes:
  git commit -m "Add feature description"
  	5.	Push to your branch:
    git push origin feature/YourFeature
    	6.	Open a pull request
