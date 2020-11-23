//
//  DateManager.swift
//  TimeManager
//
//  Created by и on 23.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import UIKit

final class DateManager {
    let calendar: Calendar
    let date: Date
    
    init() {
        calendar = Calendar.current
        date = Date()
    }
    
    init (calendar: Calendar, date: Date) {
        self.calendar = calendar
        self.date = date
    }
    
    func getMonthNumber() -> Int {
        let monthInt = Calendar.current.component(.month, from: date)
        return monthInt
    }
    
    func getYearNumber() -> Int {
        return calendar.component(.year, from: date)
    }
    
    func datesRange(from: Date, to: Date) -> [Date] {
        var fromInterval = from.timeIntervalSince1970
        let toInterval = to.timeIntervalSince1970
        var dates = [Date]()
        while fromInterval < toInterval {
            dates.append(Date(timeIntervalSince1970: fromInterval))
            fromInterval += 60 * 60 * 24
        }
        return dates
    }
    
    func getMonthDays(monthNum: Int, year: Int) -> [Date] {
        let inDate = Date("\(year)-\(monthNum)-1")
        let interval = calendar.dateInterval(of: .month, for: inDate)
        let days = datesRange(from: interval!.start, to: interval!.end + 1)
        return days
    }
}
