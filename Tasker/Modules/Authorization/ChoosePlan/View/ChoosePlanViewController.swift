//
//  ChoosePlanViewController.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit
import Lottie

final class ChoosePlanViewController: UIViewController {
    public var presenter: ChoosePlanViewPresenterProtocol!
    
    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
        
    // MARK: - Init UI Elements
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
    private lazy var continueButton = MainButton(text: "Continue", type: .withRightArrow)

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
        view.addSubviews(mainTitleLabel, textLabel, plansCollectionView, continueButton)
    }
    
    private func setupLayout() {
        mainTitleLabel.snp.makeConstraints {make -> Void in
            make.left.equalTo(view).offset(24)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
        }
        
        textLabel.snp.makeConstraints {make -> Void in
            make.left.equalTo(24)
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(8)
        }
        
        plansCollectionView.snp.makeConstraints {make -> Void in
            make.top.equalTo(textLabel.snp.bottom).offset(32)
            make.centerX.equalTo(view)
            make.width.equalTo(view).offset(-48)
            make.height.equalTo(204)
        }
        
        continueButton.snp.makeConstraints {make -> Void in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.centerX.equalTo(view)
            make.width.equalTo(view).offset(-48)
            make.height.equalTo(48)
        }
    }
    
    private func setupProperties() {
        title = "Choose plans"
        view.backgroundColor = UIColor.Pallette.background
    }
    
    private func setupTargets() {
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        plansCollectionView.register(PlansCollectionViewCell.self, forCellWithReuseIdentifier: "plansCollectionViewCell")
    }
    
    // MARK: - @objc
    @objc func continueButtonTapped() {
        presenter.continueButtonTapped()
    }
}

// MARK: - ChoosePlanViewProtocol
extension ChoosePlanViewController: ChoosePlanViewProtocol {
    func test() {
        print("hello")
    }
}

// MARK: - UICollectionViewDelegate

extension ChoosePlanViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PlansCollectionViewCell else { return }
        
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
        guard let cell = collectionView.cellForItem(at: indexPath) as? PlansCollectionViewCell else { return }
        
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

extension ChoosePlanViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.plans?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plansCollectionViewCell", for: indexPath) as? PlansCollectionViewCell else { return UICollectionViewCell() }
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
