//
//  DayViewController.swift
//  TimeManager
//
//  Created by и on 05.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import UIKit

final class DayViewController: UIViewController {
    
    private var didLayoutFlag: Bool = false
    
    private lazy var eventsCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(EventsCell.self, forCellWithReuseIdentifier: EventsCell.identifier)
        cv.backgroundColor = ThemeManager.currentTheme().backgroundColor
        cv.delegate = self
        cv.dataSource = self
        cv.isScrollEnabled = true
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    private let itemsPerRow: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEventsCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !self.didLayoutFlag {
            eventsCollectionView.scrollToItem(at: IndexPath(row: currentTime().0 - 1, section: 0), at: .top, animated: false)
            self.didLayoutFlag = true
        }
    }
}

extension DayViewController {
    func currentTime() -> (Int, Int) {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return (hour, minutes)
    }
}

//MARK:: - Setup collectons
extension DayViewController {
    func setupEventsCollectionView() {
        view.addSubview(eventsCollectionView)
        eventsCollectionView.backgroundColor = .red
        eventsCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        eventsCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        eventsCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        eventsCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        eventsCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
}

//MARK:: - UICollectoinViewDelegate and DataSource
extension DayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 23
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let eventsCell = collectionView.dequeueReusableCell(withReuseIdentifier: EventsCell.identifier, for: indexPath) as! EventsCell
        eventsCell.configTime(by: indexPath)
        return eventsCell
    }
    
/*    func scrollViewDidScroll(_ scrollView: UIScrollView) {
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
    } */
}

//MARK: - UICollectionViewDelegeteFlowLayout
extension DayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width
        return CGSize(width: width, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

