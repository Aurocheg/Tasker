//
//  ChoosePlanPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import Foundation

protocol ChoosePlanViewProtocol: AnyObject {
    func test()
}

protocol ChoosePlanViewPresenterProtocol: AnyObject {
    init(view: ChoosePlanViewProtocol, router: RouterProtocol)
    var plans: [Plan]? { get set }
    func getPlans()
}

final class ChoosePlanPresenter: ChoosePlanViewPresenterProtocol {
    weak var view: ChoosePlanViewProtocol?
    var router: RouterProtocol?
    var plans: [Plan]?
    
    required init(view: ChoosePlanViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        
        getPlans()
    }
    
    func getPlans() {
        plans = Plan.getPlans()
    }
}

