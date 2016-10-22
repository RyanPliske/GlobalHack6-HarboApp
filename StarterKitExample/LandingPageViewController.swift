//
//  LandingPageViewController.swift
//  StarterKitExample
//
//  Created by CUNNINGHAM, IAN [AG/1000] on 10/22/16.
//  Copyright © 2016 competidev. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

    @IBOutlet weak var addNew: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNewTapped(sender: AnyObject) {
        performSegueWithIdentifier("Add User", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? AddUserViewController {
            print("yesyesyesyesyesyes")
        }
    }

}
