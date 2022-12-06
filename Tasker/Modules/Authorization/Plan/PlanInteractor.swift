//
//  PlanInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class PlanInteractor: PlanInteractorProtocol {
    weak var presenter: PlanPresenterProtocol!
    
    // MARK: - Services
    var plansService: PlanServiceProtocol = PlanService()
    
    required init(presenter: PlanPresenterProtocol) {
        self.presenter = presenter
    }
        
    // MARK: - PlanInteractorProtocol Methods
    func getAllPlans() -> [Plan] {
        return plansService.getPlans()
    }
}
