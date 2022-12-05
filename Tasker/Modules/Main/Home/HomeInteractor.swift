//
//  HomeInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomePresenterProtocol!
    
    // MARK: - Services
    
    required init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - HomeInteractorProtocol Properties
    
    // MARK: - HomeInteractorProtocol Methods
}
