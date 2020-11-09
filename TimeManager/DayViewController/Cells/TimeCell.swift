//
//  TimeCell.swift
//  TimeManager
//
//  Created by и on 09.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import UIKit

final class TimeCell: UICollectionViewCell {
    
    static let identifier = "TimeCVCell"
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "time"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .black
        label.backgroundColor = .white
        label.font = label.font.withSize(10)
        #warning("colors")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: contentView.frame.width - 65).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: contentView.frame.height - 110).isActive = true
    }
}

extension TimeCell {
    func config(by indexPath: IndexPath) {
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
        case 23:
            label.text = TimeByIndex.time00.rawValue
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
