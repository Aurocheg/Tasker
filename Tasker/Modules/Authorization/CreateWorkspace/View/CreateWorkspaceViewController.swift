//
//  CreateWorkspaceViewController.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class CreateWorkspaceViewController: UIViewController {
    public var presenter: CreateWorkspaceViewPresenterProtocol!
    
    // MARK: - Variables
    
    // MARK: - Init UI Elements
    private lazy var nameLabel = TitleLabel(text: "Name", size: 16)
    private lazy var nameTF = TextField(type: .name, placeholder: "Enter name of workspace")
    private lazy var numberOfMemberLabel = TitleLabel(text: "Number of Member", size: 16)
    private lazy var numberOfMemberTF = TextField(type: .name, placeholder: "Enter number of member")
    private lazy var emailLabel = TitleLabel(text: "Email", size: 16)
    private lazy var emailTF = TextField(type: .email, placeholder: "Enter your email")
    private lazy var createButton = MainButton(text: "Create", type: .withoutArrow)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create workspace"
        view.backgroundColor = UIColor.Pallette.background
        
        // MARK: - Adding Subviews
        [nameLabel, nameTF, numberOfMemberLabel, numberOfMemberTF, emailLabel, emailTF, createButton].forEach {view in
            self.view.addSubview(view)
        }
        
        // MARK: - Setting Constraints
        setConstraints()
        
        // MARK: - Targets
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Methods
    private func setConstraints() {
        [nameLabel, numberOfMemberLabel, emailLabel].forEach {label in
            label.snp.makeConstraints {make -> Void in
                make.left.equalTo(self.view).offset(24)
            }
        }
        
        [nameTF, numberOfMemberTF, emailTF].forEach {textField in
            textField.snp.makeConstraints {make -> Void in
                make.centerX.equalTo(self.view)
                make.width.equalTo(self.view).offset(-48)
                make.height.equalTo(48)
            }
        }
        
        nameLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(24)
        }
        
        nameTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
        }
        
        numberOfMemberLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(nameTF.snp.bottom).offset(24)
        }
        
        numberOfMemberTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(numberOfMemberLabel.snp.bottom).offset(16)
        }
        
        emailLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(numberOfMemberTF.snp.bottom).offset(24)
        }
        
        emailTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(emailLabel.snp.bottom).offset(16)
        }
        
        createButton.snp.makeConstraints {make -> Void in
            make.top.equalTo(emailTF.snp.bottom).offset(32)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).offset(-48)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - @objc
    @objc func createButtonTapped() {
        presenter.createButtonTapped()
    }
    
}

extension CreateWorkspaceViewController: CreateWorkspaceViewProtocol {
    func test() {
        print("hello")
    }
}
