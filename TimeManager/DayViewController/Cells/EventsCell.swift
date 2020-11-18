//
//  EventsCell.swift
//  TimeManager
//
//  Created by и on 14.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import UIKit

final class EventsCell: UICollectionViewCell {
    
    static let identifier = "EventsCell"
    
    private var topLine: CALayer = {
        let topLine = CALayer()
        topLine.frame = CGRect(x: 0.0, y: 0.0 , width: .zero, height: .zero)
        topLine.backgroundColor = ThemeManager.currentTheme().cellLineColor.cgColor
        return topLine
        
    }()
    
    private var bottomLine: CALayer = {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 0.0, width: .zero, height: .zero)
        bottomLine.backgroundColor = UIColor.darkGray.cgColor
        return bottomLine
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "time"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = ThemeManager.currentTheme().timeCellTextColor
        label.font = label.font.withSize(10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = ThemeManager.currentTheme().backgroundColor

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        configTimeLabel()
        configTopBorder()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        bottomLine.isHidden = true
    }
}

extension EventsCell {
    func configTimeLabel() {
        self.contentView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.15/3.5).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: contentView.frame.width * -0.85 - contentView.frame.width * 0.15/3.5).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: contentView.frame.height * -0.8).isActive = true
        print(label.frame.height)
    }
    
    func configTopBorder() {
        topLine.frame = CGRect(x: contentView.frame.width * 0.17, y: 6.5, width: contentView.frame.width * 0.83 , height: 1)
        self.layer.addSublayer(topLine)
    }
    
    func configBottomBorder() {
        //bottomLine.isHidden = false
        //bottomLine.frame = CGRect(x: 5, y: self.frame.height - 6, width: self.frame.width - 5, height: 1)
        //bottomLine.backgroundColor = ThemeManager.currentTheme().cellLineColor.cgColor
        //self.layer.addSublayer(bottomLine)
    }
}

extension EventsCell {
    func configTime(by indexPath: IndexPath) {
        switch indexPath.row {
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
    }
}

enum TimeByIndex: String {
    case time00 = "00:00"
    case time01 = "01:00"
    case time02 = "02:00"
    case time03 = "03:00"
    case time04 = "04:00"
    case time05 = "05:00"
    case time06 = "06:00"
    case time07 = "07:00"
    case time08 = "08:00"
    case time09 = "09:00"
    case time10 = "10:00"
    case time11 = "11:00"
    case time12 = "12:00"
    case time13 = "13:00"
    case time14 = "14:00"
    case time15 = "15:00"
    case time16 = "16:00"
    case time17 = "17:00"
    case time18 = "18:00"
    case time19 = "19:00"
    case time20 = "20:00"
    case time21 = "21:00"
    case time22 = "22:00"
    case time23 = "23:00"
}
