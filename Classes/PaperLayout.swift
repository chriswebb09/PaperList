//
//  PaperLayout.swift
//  PaperList
//
//  Created by Christopher Webb-Orenstein on 4/14/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

struct TasklistsItemsConstants {
    static let minimumLineSpacingForSectionAt: CGFloat = 6
    static let minimumInteritemSpacingForSectionAt: CGFloat = 2.0
    static let insetForSectionAt: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 2, right: 8)
    static let sizeForItemAt: CGSize = CGSize(width:UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 6.4)
    static let cellTransform: CGAffineTransform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    static let cellTransformFinished: CGAffineTransform = CGAffineTransform(scaleX: 1, y: 1)
}


import UIKit

class TasklistsItemsFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        scrollDirection = .vertical
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 480:
                print("iPhone Classic")
            case 960, 1136, 1334:
                itemSize = CGSize(width:UIScreen.main.bounds.width / 3.12, height: UIScreen.main.bounds.height / 6.4)
            case 1920, 2208:
                itemSize = CGSize(width:UIScreen.main.bounds.width / 3.3, height: UIScreen.main.bounds.height / 6.8)
            case 2436:
                itemSize = CGSize(width: UIScreen.main.bounds.width / 4.2, height: UIScreen.main.bounds.height / 10)
            default:
                break
            }
        }
        minimumInteritemSpacing = 6
        minimumLineSpacing = TasklistsItemsConstants.minimumLineSpacingForSectionAt
        sectionInset = TasklistsItemsConstants.insetForSectionAt
        minimumInteritemSpacing = TasklistsItemsConstants.minimumInteritemSpacingForSectionAt
    }
}


import UIKit

final class LargeItemsFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        setup()
    }
    
    func setup() {
        if #available(iOS 11, *) {
            switch UIScreen.main.nativeBounds.height {
            case 480:
                print("iPhone Classic")
            case 960, 1136:
                itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 7)
                sectionInset = UIEdgeInsets(top: 15 , left: 5, bottom: 10, right: 5)
                minimumLineSpacing = 20
            case 1334:
                itemSize = CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 7.2)
                sectionInset = UIEdgeInsets(top: 10 , left: 5, bottom: 10, right: 5)
                minimumLineSpacing = 15
            case 1920:
                itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 7.2)
                sectionInset = UIEdgeInsets(top: 10 , left: 5, bottom: 10, right: 5)
                minimumLineSpacing = 15
            case 2208:
                itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 6.8)
                sectionInset = UIEdgeInsets(top: 15 , left: 5, bottom: 10, right: 5)
                minimumLineSpacing = 15
            case 2436:
                itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 7.2)
                sectionInset = UIEdgeInsets(top: 10 , left: 5, bottom: 10, right: 5)
                minimumLineSpacing = 15
            default:
                fatalError()
            }
        } else {
            switch UIScreen.main.nativeBounds.height {
            case 480:
                print("iPhone Classic")
            case 960, 1136:
                itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 7)
                sectionInset = UIEdgeInsets(top: 15 , left: 5, bottom: 10, right: 5)
                minimumLineSpacing = 20
            case 1334:
                itemSize = CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 9 )
                sectionInset = UIEdgeInsets(top: 10 , left: 5, bottom: 10, right: 5)
                minimumLineSpacing = 10
            case 1920, 2208, 2436:
                itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 7)
                sectionInset = UIEdgeInsets(top: 15 , left: 5, bottom: 10, right: 5)
                minimumLineSpacing = 20
            default:
                break
            }
        }
        scrollDirection = .vertical
    }
}
