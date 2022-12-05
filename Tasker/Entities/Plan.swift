//
//  Plan.swift
//  Tasker
//
//  Created by Aurocheg on 3.12.22.
//

import Foundation

final class Plan: Codable, Equatable {
    let emojiName: String
    let title: String
    let text: String
    
    init(emojiName: String, title: String, text: String) {
        self.emojiName = emojiName
        self.title = title
        self.text = text
    }
    
    static func getPlans() -> [Plan] {
        return [
            Plan(emojiName: "party", title: "It's free", text: "For team from 1 – 5 members"),
            Plan(emojiName: "premium", title: "Premium", text: "$19/month")
        ]
    }
    
    static func == (lhs: Plan, rhs: Plan) -> Bool {
        if lhs.emojiName == rhs.emojiName, lhs.title == rhs.title, lhs.text == rhs.text {
            return true
        }
        return false
    }
}
