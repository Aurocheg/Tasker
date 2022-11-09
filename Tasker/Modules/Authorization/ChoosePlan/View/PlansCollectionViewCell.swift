//
//  PlansCollectionViewCell.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit
import Lottie

final class PlansCollectionViewCell: UICollectionViewCell {
    // MARK: - UI Elements
    public lazy var emojiAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.loopMode = .loop
        return animationView
    }()
    public lazy var titleLabel = TitleLabel(text: "", size: 16)
    public lazy var textLabel = TextLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.color(light: .white, dark: .clear)
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 16
        
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        // MARK: - Adding Subviews
        [emojiAnimationView, titleLabel, textLabel].forEach {element in
            self.addSubview(element)
        }
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        emojiAnimationView.snp.makeConstraints {make -> Void in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(32)
            make.width.height.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints {make -> Void in
            make.centerX.equalTo(self)
            make.top.equalTo(emojiAnimationView.snp.bottom).offset(16)
        }
        
        textLabel.snp.makeConstraints {make -> Void in
            make.centerX.equalTo(self)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.width.equalTo(self).multipliedBy(0.576)
        }
    }
}
