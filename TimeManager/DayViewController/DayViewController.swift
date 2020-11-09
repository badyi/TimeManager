//
//  DayViewController.swift
//  TimeManager
//
//  Created by и on 05.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import UIKit

final class DayViewController: UIViewController {
    
    lazy var timeCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TimeCell.self, forCellWithReuseIdentifier: TimeCell.identifier)
        cv.backgroundColor = UIColor.white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    lazy var eventsCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        cv.backgroundColor = UIColor.red
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    private let itemsPerRow: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupTimeCollectionView()
        setupEventsCollectionView()
    }
    
    func setupEventsCollectionView() {
        view.addSubview(eventsCollectionView)
        eventsCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        eventsCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        eventsCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: self.view.frame.size.width * -0.15).isActive = true
        eventsCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        eventsCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        eventsCollectionView.leftAnchor.constraint(equalTo: timeCollectionView.rightAnchor).isActive = true
    }
    
    func setupTimeCollectionView() {
        view.addSubview(timeCollectionView)
        timeCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        timeCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        timeCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        timeCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: self.view.frame.size.width * -0.85).isActive = true
        timeCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
}

extension DayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 23
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        if collectionView.isEqual(timeCollectionView) {
            let timeCell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCell.identifier, for: indexPath) as! TimeCell
            timeCell.config(by: indexPath)
            return timeCell
        }
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isEqual(timeCollectionView) {
            self.syncScrollView(self.eventsCollectionView, toScrollView: timeCollectionView)
        }
        else if scrollView.isEqual(eventsCollectionView){
            self.syncScrollView(timeCollectionView, toScrollView: eventsCollectionView)
        }
    }

    func syncScrollView(_ scrollViewToScroll: UIScrollView, toScrollView scrolledView: UIScrollView) {
        var scrollBounds = scrollViewToScroll.bounds
        scrollBounds.origin.y = scrolledView.contentOffset.y
        scrollViewToScroll.bounds = scrollBounds
    }
}

//MARK: - UICollectionViewDelegeteFlowLayout
extension DayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width
        return CGSize(width: width, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

