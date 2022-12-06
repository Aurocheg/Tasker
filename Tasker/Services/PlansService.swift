//
//  PlansService.swift
//  Tasker
//
//  Created by Aurocheg on 3.12.22.
//

import Foundation

protocol PlanServiceProtocol: AnyObject {
    func getPlans() -> [Plan]
}

final class PlanService: PlanServiceProtocol {
    func getPlans() -> [Plan] {
        return Plan.getPlans()
    }
}
