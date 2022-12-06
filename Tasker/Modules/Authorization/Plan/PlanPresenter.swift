//
//  PlanPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class PlanPresenter: PlanPresenterProtocol {
    weak var view: PlanViewProtocol!
    var interactor: PlanInteractorProtocol!
    var router: PlanRouterProtocol!

    // MARK: - PlanPresenter Properties
    var plans: [Plan]?
    
    required init(view: PlanViewProtocol) {
        self.view = view
    }
    
    // MARK: - PlanPresenter Methods
    func configureView() {
        getPlans()
    }
    
    func getPlans() {
        plans = interactor.getAllPlans()
    }
    
    func continueButtonTapped() {
        router.showTabBar()
    }
}
