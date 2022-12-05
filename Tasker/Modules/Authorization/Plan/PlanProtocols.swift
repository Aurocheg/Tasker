//
//  PlanProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol PlanViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol PlanPresenterProtocol: AnyObject {
    var router: PlanRouterProtocol! { get set }
    var plans: [Plan]? { get set }
    func configureView()
    func continueButtonTapped()
    func getPlans()
}

protocol PlanInteractorProtocol: AnyObject {
    var plans: [Plan]? { get set }
    func getAllPlans()
}

protocol PlanRouterProtocol: AnyObject {
    func showTabBar()
}

protocol PlanConfiguratorProtocol: AnyObject {
    func configure(with viewController: PlanViewController)
}
