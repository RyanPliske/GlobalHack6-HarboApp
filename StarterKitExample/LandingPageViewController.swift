//
//  LandingPageViewController.swift
//  StarterKitExample
//
//  Created by CUNNINGHAM, IAN [AG/1000] on 10/22/16.
//  Copyright © 2016 competidev. All rights reserved.
//

import UIKit

class LandingPageViewController: UITabBarController {

    var model: AddUserModel!
    
    @IBOutlet weak var landingPageTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landingPageTabBar.items![2].image = UIImage.imageFromSystemBarButton(.Add)
        let darkGreenColor = UIColor(red: 17/255, green: 94/255, blue: 3/255, alpha: 1.0)
        landingPageTabBar.tintColor = darkGreenColor
    }
}
