//
//  CustomItemView.swift
//  Tasker
//
//  Created by Aurocheg on 23.11.22.
//

import UIKit
import SnapKit

final class TabItemView: UIView {
    // MARK: - Properties
    public let index: Int
    public var isSelected = false {
        didSet {
            animateItems()
        }
    }
    private let item: TabItem
    
    // MARK: - Init UI Elements
    private let containerView = UIView()
    private let iconImageView = UIImageView()
    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.color(light: UIColor.Pallette.buttonBackground,
                                             dark: UIColor(red: 1, green: 0.541, blue: 0, alpha: 1))
        view.setupCornerRadius(3)
        return view
    }()
    
    // MARK: - Init Methods
    init(with item: TabItem, index: Int) {
        self.item = item
        self.index = index
        
        super.init(frame: .zero)
        
        setupHierarchy()
        setupLayout()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupHierarchy() {
        addSubview(containerView)
        
        containerView.addSubviews(iconImageView, circleView)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.center.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.height.width.equalTo(24)
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        circleView.snp.makeConstraints {
            $0.width.height.equalTo(8)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(iconImageView.snp.bottom).offset(8)
        }
    }
    
    private func setupProperties() {
        iconImageView.image = isSelected ? item.selectedIcon : item.icon
    }
    
    // MARK: - Animations
    private func animateItems() {
        UIView.transition(with: iconImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve) {[unowned self] in
            iconImageView.image = isSelected ? item.selectedIcon : item.icon
        }
    }
    
}
