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
    public lazy var doneCircleView: UIView = {
        let view = UIView()
        let color = UIColor(red: 0.28, green: 0.76, blue: 0.448, alpha: 1)
        view.layer.cornerRadius = 16
        view.layer.borderColor = color.cgColor
        view.backgroundColor = color
        return view
    }()
    public lazy var doneCircleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "checkCircle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubviews(emojiAnimationView, titleLabel, textLabel, doneCircleView)
        doneCircleView.addSubview(doneCircleImageView)
    }
    
    private func setupLayout() {
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
        
        doneCircleView.snp.makeConstraints {make -> Void in
            make.right.equalTo(self.snp.right).offset(-8)
            make.top.equalTo(self).offset(8)
            make.width.height.equalTo(32)
        }
        
        doneCircleImageView.snp.makeConstraints {make -> Void in
            make.width.height.equalTo(24)
            make.centerX.centerY.equalTo(doneCircleView)
        }
    }
    
    private func setupProperties() {
        backgroundColor = UIColor.color(light: .white, dark: .clear)
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 16
        
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        layer.shadowRadius = 8
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 1)
        
        doneCircleView.isHidden = true
    }
}
