//
//  SegmentedControl.swift
//  Tasker
//
//  Created by Aurocheg on 25.11.22.
//

import UIKit

final class SegmentedControl: UIView {
    // MARK: - Properties
    private var buttonTitles: [String]!
    private var buttons = [UIButton]()
    
    private let textColor = UIColor(red: 0.635, green: 0.62, blue: 0.714, alpha: 1)
    private let selectorViewColor = UIColor(red: 0.392, green: 0.247, blue: 0.859, alpha: 1)
    private let selectorTextColor: UIColor = .white
    
    // MARK: - Init UI Elements
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var selectorView: UIView = {
        let view = UIView()
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        
        view.frame = CGRect(x: 0, y: frame.height, width: selectorWidth, height: 2)
        view.backgroundColor = selectorViewColor
        
        return view
    }()
    
    // MARK: - Init Method
    init(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        super.init(frame: .zero)
        
        setupHierarchy()
        setupLayout()
        setupProperties()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupHierarchy() {
        addSubviews(stackView, selectorView)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints {
            $0.top.bottom.equalTo(self)
            $0.left.right.equalTo(self)
        }
    }
    
    private func setupProperties() {
        createButtons()
    }
    
    private func setupTargets() {
        buttons.forEach { $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) }
    }
    
    private func createButtons() {
        for buttonTitle in buttonTitles {
            let button = UIButton()
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    // MARK: - @objc
    @objc func buttonTapped(_ sender: UIButton) {
        for (index, button) in buttons.enumerated() {
            button.setTitleColor(textColor, for: .normal)
            
            if sender == button {
                let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(index)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                button.setTitleColor(selectorTextColor, for: .normal)
            }
            
        }
    }
}
