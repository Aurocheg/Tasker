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
        
    // MARK: - Init UI Elements
    private lazy var mainTitleLabel = TitleLabel(text: "Choose plans", size: 18)
    private lazy var textLabel = TextLabel(text: "Unlock all features with premium plan")
    private lazy var plansCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 156, height: 204)
        
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
        self.title = "Choose plans"
        view.backgroundColor = UIColor.Pallette.background
        
        // MARK: - Adding Subviews
        [mainTitleLabel, textLabel, plansCollectionView, continueButton].forEach {view in
            self.view.addSubview(view)
        }
        
        // MARK: - Setting Constraints
        setConstraints()
        
        // MARK: - Targets
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        plansCollectionView.register(PlansCollectionViewCell.self, forCellWithReuseIdentifier: "plansCollectionViewCell")
    }
    
    // MARK: - Methods
    private func setConstraints() {
        mainTitleLabel.snp.makeConstraints {make -> Void in
            make.left.equalTo(self.view).offset(24)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(24)
        }
        
        textLabel.snp.makeConstraints {make -> Void in
            make.left.equalTo(24)
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(8)
        }
        
        plansCollectionView.snp.makeConstraints {make -> Void in
            make.top.equalTo(textLabel.snp.bottom).offset(32)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).offset(-48)
            make.height.equalTo(204)
        }
        
        continueButton.snp.makeConstraints {make -> Void in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-5)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).offset(-48)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - @objc
    @objc func continueButtonTapped() {
        
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
        
        return cell
    }
}
