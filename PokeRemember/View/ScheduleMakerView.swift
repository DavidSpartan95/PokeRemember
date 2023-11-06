//
//  ScheduleMakerView.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-11-06.
//

import SwiftUI
import EventKit

struct ScheduleMakerView: View {
    @State private var selectedDay = "Friday" // Default to Friday
    @State private var selectedTime = Date()

    let weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var body: some View {
        VStack {
            Text("Select day to study (4 week reuccuring)")

            Picker("Day of the Week", selection: $selectedDay) {
                ForEach(weekdays, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(WheelPickerStyle()) // Use WheelPickerStyle
            .padding()

            DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding()

            Button("Save Recurring Event") {
                saveRecurringEvent()
            }
            .padding()
        }
    }
    //TODO move this to Model
    func saveRecurringEvent() {
        let eventStore = EKEventStore()

        eventStore.requestAccess(to: .event) { (granted, error) in
            if granted && error == nil {
                let calendar = Calendar.current
                let today = calendar.startOfDay(for: Date())
                var selectedWeekday = weekdays.firstIndex(of: selectedDay) ?? 0
                print("selectedWeekday \(selectedWeekday)")
                //THIS FIXES THE BUG WERE THE DATE SELECTED WOULD ALWAYS BE ONE DAY EARLY
                selectedWeekday += 1

                // Find the next occurrence of the selected day or the same day
                var startDate = today
                while calendar.component(.weekday, from: startDate) != selectedWeekday + 1 {
                    startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
                }

                // Create events for the next two occurrences
                for i in 0..<4 {
                    let studyEvent = EKEvent(eventStore: eventStore)
                    studyEvent.title = "PokeRemember study session"
                    studyEvent.startDate = calendar.date(bySettingHour: calendar.component(.hour, from: selectedTime), minute: calendar.component(.minute, from: selectedTime), second: 0, of: startDate)

                    // Set the event duration to 20 minutes
                    let endDate = calendar.date(byAdding: .minute, value: 20, to: studyEvent.startDate)
                    studyEvent.endDate = endDate

                    studyEvent.calendar = eventStore.defaultCalendarForNewEvents

                    do {
                        try eventStore.save(studyEvent, span: .thisEvent)
                        print("Recurring event saved successfully")
                    } catch {
                        print("Error saving recurring event: \(error.localizedDescription)")
                    }

                    // Calculate date for the next occurrence
                    startDate = calendar.date(byAdding: .weekOfYear, value: 1, to: startDate)!
                }
            } else {
                print("Permission not granted or error: \(error?.localizedDescription ?? "No error")")
            }
        }
    }
}
