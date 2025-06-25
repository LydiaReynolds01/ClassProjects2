//
//  ViewController.swift
//  AppEventCount
//
//  Created by Lydia Reynolds on 6/17/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var didFinishLaunchingLabel: UILabel!
    @IBOutlet var didConfigForConnectLabel: UILabel!
    @IBOutlet var sceneWillConnectToLabel: UILabel!
    @IBOutlet var sceneDidBecomeActiveLabel: UILabel!
    @IBOutlet var sceneWillResignActiveLabel: UILabel!
    @IBOutlet var sceneWillEnterForegroundLabel: UILabel!
    @IBOutlet var sceneDidEnterBackgroundLabel: UILabel!
    
    var sceneWillConnectToCount: Int = 0
    var sceneDidBecomeActiveCount: Int = 0
    var sceneWillResignActiveCount: Int = 0
    var sceneWillEnterForegroundCount: Int = 0
    var sceneDidEnterBackgroundCount: Int = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    func updateView() {
        didFinishLaunchingLabel.text = "The App has launched \(appDelegate.launchCount) time(s)."
        didConfigForConnectLabel.text = "The SceneDelegate has configured for connection \(appDelegate.configurationForConnectingCount) time(s)."
        sceneWillConnectToLabel.text = "The SceneDelegate is connecting to a scene \(sceneWillConnectToCount) time(s)."
        sceneDidBecomeActiveLabel.text = "The SceneDelegate has become active \(sceneDidBecomeActiveCount) time(s)."
        sceneWillResignActiveLabel.text = "The SceneDelegate is resigning active \(sceneWillResignActiveCount) time(s)."
        sceneWillEnterForegroundLabel.text = "The SceneDelegate is entering the foreground \(sceneWillEnterForegroundCount) time(s)."
        sceneDidEnterBackgroundLabel.text = "The SceneDelegate is entering the background \(sceneDidEnterBackgroundCount) time(s)."
        
    }

}

