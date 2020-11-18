//
//  MainNavigationController.swift
//  TimeManager
//
//  Created by и on 04.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import UIKit

final class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ThemeManager.currentTheme().backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let yearVC = YearViewController()
        let monthVC = MonthViewController()
        let dayVC = DayViewController()
        dayVC.title = "DayVC"
        monthVC.title = "MonthVC"
        yearVC.title = "YearVC"
        self.viewControllers = [yearVC, monthVC, dayVC]
    }
}
