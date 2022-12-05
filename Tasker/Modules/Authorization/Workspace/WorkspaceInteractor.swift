//
//  WorkspaceInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class WorkspaceInteractor: WorkspaceInteractorProtocol {
    weak var presenter: WorkspacePresenterProtocol!
    
    // MARK: - Services
    
    required init(presenter: WorkspacePresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - WorkspaceInteractorProtocol Properties
    
    // MARK: - WorkspaceInteractorProtocol Methods
}
