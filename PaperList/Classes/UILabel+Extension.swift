//
//  UILabel+Extension.swift
//  PaperList
//
//  Created by Christopher Webb-Orenstein on 4/14/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

extension UILabel {
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor, font: UIFont) {
        let strokeTextAttributes = [
            NSAttributedStringKey.strokeColor : oulineColor,
            NSAttributedStringKey.foregroundColor : foregroundColor,
            NSAttributedStringKey.strokeWidth : -5.0,
            NSAttributedStringKey.font : font
            ] as [NSAttributedStringKey : Any]
        
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
        
        
    }
}
