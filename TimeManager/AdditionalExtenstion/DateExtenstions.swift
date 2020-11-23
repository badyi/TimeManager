//
//  DateExtenstions.swift
//  TimeManager
//
//  Created by и on 17.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import Foundation

extension Date {
    func monthName() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: now)
        return nameOfMonth
    }
    
    func monthName(by numberOfMonth: Int) -> String {
        switch numberOfMonth {
        case 0:
            return "January"
        case 1:
            return "February"
        case 2:
            return "March"
        case 3:
            return "April"
        case 4:
            return "May"
        case 5:
            return "June"
        case 6:
            return "July"
        case 7:
            return "August"
        case 8:
            return "September"
        case 9:
            return "October"
        case 10:
            return "November"
        case 11:
            return "December"
        default:
            return "Error"
        }
    }
    
    func int() -> (Int, Int) {
        let date = self
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return (hour, minutes)
    }

    func string(in formatt: (String, String)) -> (String, String) {
        let today = self
        let formatter1 = DateFormatter()
        let formatter2 = DateFormatter()
        formatter1.dateFormat = formatt.0
        formatter2.dateFormat = formatt.1
        return (formatter1.string(from: today), formatter2.string(from: today))
    }
    
    func year() -> Int {
        let date = self
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }
    
    func month() -> Int {
        let date = self
        let calendar = Calendar.current
        return calendar.component(.month, from: date)
    }
    
    func day() -> Int {
        let date = self
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }
    
    static func interval(_ calendarComponent: Calendar.Component, _ date: Date) -> DateInterval {
        let calendar = Calendar.current
        let interval = calendar.dateInterval(of: calendarComponent, for: date)!
        return interval
    }
    
    static func datesRange(from: Date, to: Date) -> [Date] {
        if from > to { return [Date]() }

        var tempDate = from
        var array = [tempDate]

        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }

        return array
    }
    
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}
