//
//  BoardViewController.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

final class BoardViewController: UIViewController {
    // MARK: - Init UI Elements
    private lazy var boardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private lazy var boardTitleLabel = TitleLabel(text: "")
    private lazy var boardTextLabel = TextLabel()
    private lazy var buttonsStackView = StackView(spacing: 13)
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrowNext")
        
        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor.Pallette.buttonBackground
        button.layer.cornerRadius = 30
        
        return button
    }()
    private lazy var skipButton: UIButton = {
        let button = SecondaryButton(text: "Skip")
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    init(boardWith: Board) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.Pallette.background
        edgesForExtendedLayout = []
        
        // MARK: - Setting Values
        if let image = UIImage(named: boardWith.image) {
            boardImageView.image = image
        }
        
        boardTitleLabel.text = boardWith.title
        boardTextLabel.text = boardWith.text
        
        // MARK: - Adding Subviews
        [boardImageView, boardTitleLabel, boardTextLabel, buttonsStackView].forEach {element in
            self.view.addSubview(element)
        }
        
        [nextButton, skipButton].forEach {element in
            buttonsStackView.addArrangedSubview(element)
        }
        
        // MARK: - Setting Constraints
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setConstraints() {
        boardImageView.snp.makeConstraints {make -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(90)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).offset(-42)
            make.height.equalTo(332)
        }
        
        boardTitleLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(boardImageView.snp.bottom).offset(56)
            make.centerX.equalTo(self.view)
        }
        
        boardTextLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(boardTitleLabel.snp.bottom).offset(14)
            make.centerX.equalTo(self.view)
        }
        
        buttonsStackView.snp.makeConstraints {make -> Void in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.left.equalTo(self.view).offset(24)
        }
        
        nextButton.snp.makeConstraints {make -> Void in
            make.width.height.equalTo(60)
        }
    }
    
    // MARK: - @objc
}
