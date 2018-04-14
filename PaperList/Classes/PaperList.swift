//
//  PaperList.swift
//  PaperList
//
//  Created by Christopher Webb-Orenstein on 4/14/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

public class PaperListViewController: UIViewController {
    
    var collectionView: UICollectionView? = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: LargeItemsFlowLayout())
    
    var tasklistNum: Int
    
    convenience init(listNumber: Int) {
        self.init(nibName: nil, bundle: nil)
        self.tasklistNum = listNumber
    }
    
    override init(nibName: String?, bundle nibBundle: Bundle?) {
        self.tasklistNum = 0
        super.init(nibName: nibName, bundle: nibBundle)
    }
    
    required public init?(coder decoder: NSCoder) {
        self.tasklistNum = 0
        super.init(coder: decoder)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.addSubview(collectionView!)
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        collectionView?.register(PaperCell.self, forCellWithReuseIdentifier: "Taskslist")
        DispatchQueue.main.async {
            self.tabBarController?.navigationController?.navigationItem.title = "Task List \(self.tasklistNum)"
            self.title = "Task List \(self.self.tasklistNum)"
            self.tabBarItem.title = "Tasks"
            print(self.tasklistNum)
        }
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = self.tabBarController?.selectedIndex = 1
        DispatchQueue.main.async {
            DispatchQueue.main.async {
                self.tabBarController?.navigationController?.navigationItem.title = "Task List \(self.tasklistNum)"
                self.tabBarController?.navigationItem.leftBarButtonItem =  self.navigationItem.leftBarButtonItem
                self.tabBarController?.navigationItem.rightBarButtonItem = self.navigationItem.rightBarButtonItem
                print(self.tasklistNum)
            }
        }
    }
    
    @objc func edit() {
        print("EDIT")
        navigationController?.popToRootViewController(animated: true)
    }
}

extension PaperListViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Taskslist", for: indexPath) as! PaperCell
        cell.configure()
        cell.titleLabel.text = "Task Item \(indexPath.row + 1)"
        cell.titleLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .medium)
        cell.titleLabel.makeOutLine(oulineColor: .lightGray , foregroundColor: .white, font: UIFont(name: "Menlo", size: 20)!)
        return cell
    }
}

extension PaperListViewController: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
