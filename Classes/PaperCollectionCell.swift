//
//  PaperCollectionCell.swift
//  PaperList
//
//  Created by Christopher Webb-Orenstein on 4/14/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

public protocol Shadowed {
    func applyShadow()
}

extension Shadowed where Self UIView {
    func applyShadow() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.layer.shadowColor = UIColor.black.cgColor
            strongSelf.layer.shadowOpacity = 0.27
            strongSelf.layer.shadowOffset = CGSize(width: 1, height: 4.9)
            strongSelf.layer.shadowRadius = 6
            strongSelf.layer.addSublayer(strongSelf.containerLayer!)
            strongSelf.layer.cornerRadius = 6
        }
    }
}

open class PaperCell: UICollectionViewCell {
    
    let containerLayer: CALayer? = CALayer()
    
    var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Menlo-Bold", size: 15.0)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .lightText
        var outLineColor = UIColor(red:0.18, green:0.56, blue:0.84, alpha:1.0)
        var font = UIFont(name: "Menlo-Bold", size: 15.0)!
        titleLabel.makeOutLine(oulineColor: outLineColor , foregroundColor: .white, font: font)
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        return titleLabel
    }()
    
    var subtitleLabel: UILabel = {
        var subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        subtitleLabel.textAlignment = .left
        subtitleLabel.textColor = .gray
        subtitleLabel.sizeToFit()
        subtitleLabel.numberOfLines = 0
        return subtitleLabel
    }()
    
    func configure() {
        self.setupUI()
    }
    
    func setupUI() {
        viewConfigurations()
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.layer.shadowColor = UIColor.black.cgColor
            strongSelf.layer.shadowOpacity = 0.27
            strongSelf.layer.shadowOffset = CGSize(width: 1, height: 4.9)
            strongSelf.layer.shadowRadius = 6
            strongSelf.layer.addSublayer(strongSelf.containerLayer!)
            strongSelf.layer.cornerRadius = 6
        }
        backgroundColor = .white
        layer.masksToBounds = false
        backgroundView = UIView()
        setup(backgroundView: backgroundView!)
        contentView.sendSubview(toBack: backgroundView!)
    }
    
    // MARK: View setup methods
    
    private func viewConfigurations() {
        setup(titleLabel: titleLabel)
        setup(subtitleLabel: subtitleLabel)
    }
    
    func setup(backgroundView: UIView) {
        contentView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
    }
    
    func setup(titleLabel: UILabel) {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 480, 960, 1136:
                NSLayoutConstraint.activate([
                    titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
                    titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
                    ])
            case 1334, 1920, 2208, 2436:
                NSLayoutConstraint.activate([
                    titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
                    titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4)
                    ])
            default:
                break
            }
        }
    }
    
    func setup(subtitleLabel: UILabel) {
        contentView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 480, 960, 1136:
                NSLayoutConstraint.activate([
                    subtitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
                    subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.88),
                    subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
                    subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -30)
                    ])
            case 1334, 1920, 2208, 2436:
                NSLayoutConstraint.activate([
                    subtitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
                    subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.88),
                    subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -2),
                    subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 58)
                    ])
            default:
                break
            }
        }
    }
}
