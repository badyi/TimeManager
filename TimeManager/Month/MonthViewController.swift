//
//  MonthViewController.swift
//  TimeManager
//
//  Created by и on 15.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import UIKit

final class MonthViewController: UIViewController {
    
    private lazy var monthCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        cv.register(MonthHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MonthHeaderView.identifier)
        cv.backgroundColor = ThemeManager.currentTheme().backgroundColor
        cv.delegate = self
        cv.dataSource = self
        cv.isScrollEnabled = true
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMonthCollectionView()
    }
}

extension MonthViewController {
    func setupMonthCollectionView() {
        view.addSubview(monthCollectionView)
        monthCollectionView.backgroundColor = ThemeManager.currentTheme().backgroundColor
        monthCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        monthCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        monthCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        monthCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        monthCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        monthCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
}

extension MonthViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = monthCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .brown
        return cell
    }
}

extension MonthViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = monthCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MonthHeaderView.identifier, for: indexPath) as! MonthHeaderView
        header.configurate()
        header.setTitle(with: Date().monthName(by: indexPath.section))
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height / 6
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let tabBarHeight = (tabBarController?.tabBar.frame.size.height ?? 0)
        let width = collectionView.frame.width
        let height = collectionView.frame.height * 5/6 - navBarHeight - tabBarHeight - statusBarHeight
        return CGSize(width: width, height: height)
    }
}
