//
//  StringExtension.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import UIKit

extension String {
    func displayDate() -> String {
        let df: DateFormatter = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        if let msgDate: Date = df.date(from: self) {
            let now: Date = Date()
            let diff = Calendar.current.dateComponents([.day], from: msgDate, to: now)
            if diff.day == 0 {
                let dfHours: DateFormatter = DateFormatter()
                dfHours.dateFormat = "HH:mm"
                return dfHours.string(from: msgDate)
            } else {
                let dfDay: DateFormatter = DateFormatter()
                dfDay.dateFormat = "dd/MM/yy"
                return dfDay.string(from: msgDate)
            }
        }
        return ""
    }
    
    func messageDisplayDate() -> String {
        let df: DateFormatter = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        if let msgDate: Date = df.date(from: self) {
            let now: Date = Date()
            let diff = Calendar.current.dateComponents([.day], from: msgDate, to: now)
            if diff.day == 0 {
                let dfHours: DateFormatter = DateFormatter()
                dfHours.dateFormat = "HH:mm"
                return dfHours.string(from: msgDate)
            } else {
                let dfDay: DateFormatter = DateFormatter()
                dfDay.dateFormat = "HH:mm dd/MM/yy"
                return dfDay.string(from: msgDate)
            }
        }
        return ""
    }
}
