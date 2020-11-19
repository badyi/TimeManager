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
    private let cellHeight: CGFloat = 60
    private let edgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    
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
    
    private lazy var timeVerticalLine: CALayer = {
        let line = CALayer()
        line.frame = CGRect(x: 0.0, y: 0.0, width: .zero, height: .zero)
        line.backgroundColor = UIColor.red.cgColor
        #warning("Color of line")
        return line
    }()
    
    private let itemsPerRow: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEventsCollectionView()
        setupTimeLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTimeLine()
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
    func setupTimeLine() {
        let y = Double((currentTime().0 - 1) * 60 + currentTime().1) + 10
        timeVerticalLine.frame = CGRect(x: 0.0, y: y, width: Double(view.bounds.width), height: 0.5)
        eventsCollectionView.layer.addSublayer(timeVerticalLine)
        #warning("fix x and add time label")
    }
    
    func currentTime() -> (Int, Int) {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return (hour, minutes)
    }
    
    func setupTimeLabels() {
        for i in 0..<23 {
            let label = timeLabelFactory.configTime(by: i)
            let labelWidth = self.view.bounds.width * 0.11
            let spaceBetweenLeadingAndLine = self.view.frame.width * 0.15
            eventsCollectionView.addSubview(label)
            label.leadingAnchor.constraint(equalTo: self.eventsCollectionView.leadingAnchor, constant: spaceBetweenLeadingAndLine - labelWidth).isActive = true
            label.topAnchor.constraint(equalTo: self.eventsCollectionView.topAnchor, constant: cellHeight * CGFloat(i) + edgeInsets.top - (cellHeight * 0.2 / 2)).isActive = true
            label.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
            label.heightAnchor.constraint(equalToConstant: cellHeight * 0.2).isActive = true
        }
    }
}

//MARK:: - Setup collectons
extension DayViewController {
    func setupEventsCollectionView() {
        view.addSubview(eventsCollectionView)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return edgeInsets
    }
}

final class timeLabelFactory {
    public static func configTime(by index: Int) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = "time"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = ThemeManager.currentTheme().timeCellTextColor
        label.font = label.font.withSize(12)
        
        switch index {
        case 0:
            label.text = TimeByIndex.time00.rawValue
        case 1:
            label.text = TimeByIndex.time01.rawValue
        case 2:
            label.text = TimeByIndex.time02.rawValue
        case 3:
            label.text = TimeByIndex.time03.rawValue
        case 4:
            label.text = TimeByIndex.time05.rawValue
        case 5:
            label.text = TimeByIndex.time06.rawValue
        case 6:
            label.text = TimeByIndex.time07.rawValue
        case 7:
            label.text = TimeByIndex.time08.rawValue
        case 8:
            label.text = TimeByIndex.time09.rawValue
        case 9:
            label.text = TimeByIndex.time10.rawValue
        case 10:
            label.text = TimeByIndex.time11.rawValue
        case 11:
            label.text = TimeByIndex.time12.rawValue
        case 12:
            label.text = TimeByIndex.time13.rawValue
        case 13:
            label.text = TimeByIndex.time14.rawValue
        case 14:
            label.text = TimeByIndex.time15.rawValue
        case 15:
            label.text = TimeByIndex.time16.rawValue
        case 16:
            label.text = TimeByIndex.time17.rawValue
        case 17:
            label.text = TimeByIndex.time18.rawValue
        case 18:
            label.text = TimeByIndex.time19.rawValue
        case 19:
            label.text = TimeByIndex.time20.rawValue
        case 20:
            label.text = TimeByIndex.time21.rawValue
        case 21:
            label.text = TimeByIndex.time22.rawValue
        case 22:
            label.text = TimeByIndex.time23.rawValue
        default:
            label.text = "out of range"
        }
        return label
    }
}
