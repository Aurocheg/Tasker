//
//  WorkspaceViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class WorkspaceViewController: UIViewController, WorkspaceViewProtocol {
    var presenter: WorkspacePresenterProtocol!
    var configurator: WorkspaceConfiguratorProtocol = WorkspaceConfigurator()
    
    // MARK: - UI Elements
    private lazy var nameLabel = TitleLabel(text: "Name", size: 16)
    private lazy var nameTF = TextField(type: .name, placeholder: "Enter name of workspace", view: view)
    private lazy var numberOfMemberLabel = TitleLabel(text: "Number of Member", size: 16)
    private lazy var numberOfMemberTF = TextField(type: .name, placeholder: "Enter number of member", view: view)
    private lazy var emailLabel = TitleLabel(text: "Email", size: 16)
    private lazy var emailTF = TextField(type: .email, placeholder: "Enter your email", view: view)
    private lazy var createButton = LargeButton(text: "Create", type: .withoutArrow)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupProperties()
        setupTargets()
        
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    // MARK: - WorkspaceViewProtocol Methods
    func setupHierarchy() {
        view.addSubviews(nameLabel, nameTF, numberOfMemberLabel, numberOfMemberTF, emailLabel, emailTF, createButton)
    }
    
    func setupLayout() {
        [nameLabel, numberOfMemberLabel, emailLabel].forEach {label in
            label.snp.makeConstraints {
                $0.left.equalTo(view).offset(24)
            }
        }
        
        [nameTF, numberOfMemberTF, emailTF].forEach {textField in
            textField.snp.makeConstraints {
                $0.centerX.equalTo(view)
                $0.width.equalTo(view).offset(-48)
                $0.height.equalTo(48)
            }
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
        }
        
        nameTF.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(16)
        }
        
        numberOfMemberLabel.snp.makeConstraints {
            $0.top.equalTo(nameTF.snp.bottom).offset(24)
        }
        
        numberOfMemberTF.snp.makeConstraints {
            $0.top.equalTo(numberOfMemberLabel.snp.bottom).offset(16)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(numberOfMemberTF.snp.bottom).offset(24)
        }
        
        emailTF.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(16)
        }
        
        createButton.snp.makeConstraints {
            $0.top.equalTo(emailTF.snp.bottom).offset(32)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
        }
    }
    
    func setupProperties() {
        title = "Create workspace"
        view.backgroundColor = UIColor.Pallette.background
    }
    
    func setupTargets() {
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }
        
    // MARK: - Targets
    @objc func createButtonTapped() {
        presenter.createButtonTapped()
    }
}
