//
//  YearViewController.swift
//  TimeManager
//
//  Created by и on 15.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//
import UIKit

final class YearViewController: UIViewController {
    
    private lazy var monthCollectoinView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
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

extension YearViewController {
    func setupMonthCollectionView() {
        view.addSubview(monthCollectoinView)
        monthCollectoinView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        monthCollectoinView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        monthCollectoinView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        monthCollectoinView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension YearViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = monthCollectoinView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
}
