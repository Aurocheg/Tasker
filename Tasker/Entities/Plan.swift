//
//  Plan.swift
//  Tasker
//
//  Created by Aurocheg on 3.12.22.
//

import Foundation

protocol PlanProtocol {
    var emojiName: String { get set }
    var title: String { get set }
    var text: String { get set }
    static func getPlans() -> [Plan]
}

struct Plan: PlanProtocol {
    var emojiName: String
    var title: String
    var text: String
    
    static func getPlans() -> [Plan] {
        return [
            Plan(emojiName: "party", title: "It's free", text: "For team from 1 – 5 members"),
            Plan(emojiName: "premium", title: "Premium", text: "$19/month")
        ]
    }
}
