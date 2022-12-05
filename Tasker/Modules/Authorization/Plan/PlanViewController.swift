//
//  PlanViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit
import Lottie

final class PlanViewController: UIViewController, PlanViewProtocol {
    var presenter: PlanPresenterProtocol!
    var configurator: PlanConfiguratorProtocol = PlanConfigurator()
    
    private let screenWidth = UIScreen.main.bounds.width
    private let plansCollectionCellID = "plansCollectionViewCell"
    
    // MARK: - UI Elements
    private lazy var mainTitleLabel = TitleLabel(text: "Choose plans", size: 18)
    private lazy var textLabel = TextLabel(text: "Unlock all features with premium plan")
    private lazy var plansCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: screenWidth * 0.41, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    private lazy var continueButton = LargeButton(text: "Continue", type: .withRightArrow)
    
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
    
    // MARK: - PlanViewProtocol Methods
    func setupHierarchy() {
        view.addSubviews(mainTitleLabel, textLabel, plansCollectionView, continueButton)
    }
    
    func setupLayout() {
        mainTitleLabel.snp.makeConstraints {
            $0.left.equalTo(view).offset(24)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
        }
        
        textLabel.snp.makeConstraints {
            $0.left.equalTo(24)
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(8)
        }
        
        plansCollectionView.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(32)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(204)
        }
        
        continueButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
        }
    }
    
    func setupProperties() {
        title = "Choose plans"
        view.backgroundColor = UIColor.Pallette.background
    }
    
    func setupTargets() {
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        plansCollectionView.register(PlanCollectionViewCell.self, forCellWithReuseIdentifier: plansCollectionCellID)
    }
        
    // MARK: - Targets
    @objc func continueButtonTapped() {
        presenter.continueButtonTapped()
    }
}

// MARK: - UICollectionViewDelegate
extension PlanViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PlanCollectionViewCell else { return }
        
        cell.backgroundColor = UIColor.Pallette.buttonBackground
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.doneCircleView.isHidden = false
        
        if indexPath.row == 1 {
            cell.titleLabel.textColor = UIColor(red: 1, green: 0.541, blue: 0, alpha: 1)
        } else {
            cell.titleLabel.textColor = .white
        }
        
        cell.textLabel.textColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PlanCollectionViewCell else { return }
        
        cell.doneCircleView.isHidden = true
        cell.backgroundColor = UIColor.color(light: .white, dark: .clear)
        cell.layer.borderColor = UIColor.white.cgColor
        
        if indexPath.row == 1 {
            cell.titleLabel.textColor = UIColor(red: 1, green: 0.541, blue: 0, alpha: 1)
        } else {
            cell.titleLabel.textColor = UIColor.Pallette.titleColor
        }
        
        cell.textLabel.textColor = UIColor(red: 0.635, green: 0.62, blue: 0.714, alpha: 1)
    }
}

// MARK: - UICollectionViewDataSource
extension PlanViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.plans?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: plansCollectionCellID, for: indexPath) as? PlanCollectionViewCell else {
            return UICollectionViewCell()
        }
        let plan = presenter.plans?[indexPath.row] ?? Plan(emojiName: "error", title: "error", text: "error")
        let emojiPath = Bundle.main.path(forResource: plan.emojiName, ofType: "json")!
        
        cell.emojiAnimationView.animation = LottieAnimation.filepath(emojiPath)
        cell.emojiAnimationView.play()
        cell.titleLabel.text = plan.title
        cell.textLabel.text = plan.text
        
        if indexPath.row == 1 {
            cell.titleLabel.textColor = UIColor(red: 1, green: 0.541, blue: 0, alpha: 1)
        }
        
        return cell
    }
}
