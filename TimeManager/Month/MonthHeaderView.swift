//
//  MonthHeaderView.swift
//  TimeManager
//
//  Created by и on 16.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import UIKit

final class MonthHeaderView: UICollectionReusableView {
    static let identifier = "MonthHeaderView"
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "November"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = ThemeManager.currentTheme().timeCellTextColor
        label.font = label.font.withSize(22)
        return label
    }()
    
    private lazy var dayNamesStackView: UIStackView = {
        let dayNames = ["M", "T", "W", "T", "F", "S", "S"]
        let label1 = UILabel(frame: .zero)
        let label2 = UILabel(frame: .zero)
        let label3 = UILabel(frame: .zero)
        let label4 = UILabel(frame: .zero)
        let label5 = UILabel(frame: .zero)
        let label6 = UILabel(frame: .zero)
        let label7 = UILabel(frame: .zero)
        let labels = [label1, label2, label3, label4, label5, label6, label7]
        
        for i in 0..<7 {
            labels[i].text = dayNames[i]
            labels[i].textAlignment = .center
            labels[i].textColor = ThemeManager.currentTheme().titleTextColor
            labels[i].translatesAutoresizingMaskIntoConstraints = false
            labels[i].widthAnchor.constraint(equalToConstant: self.frame.width/CGFloat(dayNames.count)).isActive = true
        }
        
        let sv = UIStackView(arrangedSubviews: labels)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.spacing = 0
        sv.distribution = .fillProportionally
        return sv
    }()
    
    
    public func configurate() {
        self.backgroundColor = ThemeManager.currentTheme().backgroundColor
        addSubview(label)
        addSubview(dayNamesStackView)
        
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor, constant: self.frame.width - 10).isActive = true
        label.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -self.frame.height/2).isActive = true
        
        dayNamesStackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 1).isActive  = true
        dayNamesStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        dayNamesStackView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -self.frame.height/2).isActive = true
        dayNamesStackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        dayNamesStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    public func setTitle(with text: String) {
        label.text = text
    }
}
