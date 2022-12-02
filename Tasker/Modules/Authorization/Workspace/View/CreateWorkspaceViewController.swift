//
//  CreateWorkspaceViewController.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class CreateWorkspaceViewController: UIViewController {
    public var presenter: CreateWorkspaceViewPresenterProtocol!
        
    // MARK: - Init UI Elements
    private lazy var nameLabel = TitleLabel(text: "Name", size: 16)
    private lazy var nameTF = TextField(type: .name, placeholder: "Enter name of workspace", view: view)
    private lazy var numberOfMemberLabel = TitleLabel(text: "Number of Member", size: 16)
    private lazy var numberOfMemberTF = TextField(type: .name, placeholder: "Enter number of member", view: view)
    private lazy var emailLabel = TitleLabel(text: "Email", size: 16)
    private lazy var emailTF = TextField(type: .email, placeholder: "Enter your email", view: view)
    private lazy var createButton = MainButton(text: "Create", type: .withoutArrow)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupHierarchy()
        setupLayout()
        setupProperties()
        setupTargets()
    }
    
    // MARK: - Methods
    private func setupHierarchy() {
        view.addSubviews(nameLabel, nameTF, numberOfMemberLabel, numberOfMemberTF, emailLabel, emailTF, createButton)
    }
    
    private func setupLayout() {
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
    
    private func setupProperties() {
        title = "Create workspace"
        view.backgroundColor = UIColor.Pallette.background
    }
    
    private func setupTargets() {
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - @objc
    @objc func createButtonTapped() {
        presenter.createButtonTapped()
    }
    
}

// MARK: - CreateWorkspaceViewProtocol
extension CreateWorkspaceViewController: CreateWorkspaceViewProtocol {
    func test() {
        print("hello")
    }
}
