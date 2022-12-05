//
//  ChatProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol ChatViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol ChatPresenterProtocol: AnyObject {
    var router: ChatRouterProtocol! { get set }
    func configureView()
}

protocol ChatInteractorProtocol: AnyObject {
    
}

protocol ChatRouterProtocol: AnyObject {
    
}

protocol ChatConfiguratorProtocol: AnyObject {
    func configure(with viewController: ChatViewController)
}
