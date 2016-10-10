//
//  ViewController.swift
//  SafeZoneLauncher
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLaunchButtonTouchUpInside(sender: AnyObject) {
        
        let launchUrl = NSURL(string: "com.criticalarc.safezoneapp://launch")!
        let storeUrlFormat = "http://itunes.apple.com/%@/app/id533054756"
        
        if (UIApplication.sharedApplication().canOpenURL(launchUrl)) {
            UIApplication.sharedApplication().openURL(launchUrl)
        } else {
            let storeUrlString = String(format: storeUrlFormat, NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as NSString)
            let storeUrl = NSURL(string: storeUrlString)!
            UIApplication.sharedApplication().openURL(storeUrl)
        }
    }

}

