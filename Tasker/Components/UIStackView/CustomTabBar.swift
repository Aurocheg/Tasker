//
//  TabItem.swift
//  Tasker
//
//  Created by Aurocheg on 23.11.22.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

final class CustomTabBar: UIStackView {
    // MARK: - Properties
    public var itemTapped: Observable<Int> {
        itemTappedSubject.asObservable()
    }
    
    private lazy var tabItemsView: [TabItemView] = [homeItem, chatItem, notificationItem, settingsItem]
    private let homeItem = TabItemView(with: .home, index: 0)
    private let chatItem = TabItemView(with: .chat, index: 1)
    private let notificationItem = TabItemView(with: .notification, index: 2)
    private let settingsItem = TabItemView(with: .settings, index: 3)
    
    private let itemTappedSubject = PublishSubject<Int>()
    private let disposeBag = DisposeBag()
    
    
    // MARK: - Init Method
    init() {
        super.init(frame: .zero)
        
        setupHierarchy()
        setupProperties()
        bind()
        
        setNeedsLayout()
        layoutIfNeeded()
        selectItem(index: 0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupHierarchy() {
        addArrangedSubviews([homeItem, chatItem, notificationItem, settingsItem])
    }
    
    private func setupProperties() {
        distribution = .fillEqually
        alignment = .center
        
        backgroundColor = UIColor.color(light: .white, dark: UIColor.Pallette.buttonBackground)
        setupCornerRadius(16)
        
        tabItemsView.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
        }
    }
    
    private func selectItem(index: Int) {
        tabItemsView.forEach { $0.isSelected = $0.index == index }
        itemTappedSubject.onNext(index)
    }
    
    // MARK: - Bindings
    private func bind() {
        homeItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.homeItem.animateClick {
                    self.selectItem(index: self.homeItem.index)
                }
            }
            .disposed(by: disposeBag)
        
        chatItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.chatItem.animateClick {
                    self.selectItem(index: self.chatItem.index)
                }
            }
            .disposed(by: disposeBag)
        
        notificationItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.notificationItem.animateClick {
                    self.selectItem(index: self.notificationItem.index)
                }
            }
            .disposed(by: disposeBag)
        settingsItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.settingsItem.animateClick {
                    self.selectItem(index: self.settingsItem.index)
                }
            }
            .disposed(by: disposeBag)
    }
}
