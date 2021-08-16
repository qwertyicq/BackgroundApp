//
//  ViewController.swift
//  backgroundApp
//
//  Created by Nikolay T on 16.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewContainer: UIImageView!
    @IBOutlet weak var switcher: UISwitch!
    
    let state = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if state.bool(forKey: "state") {
            imageViewContainer.image = UIImage(named: "dark")
            
            self.overrideUserInterfaceStyle = .dark
            self.imageViewContainer.overrideUserInterfaceStyle = .dark
            self.switcher.overrideUserInterfaceStyle = .dark
            
            switcher.setOn(true, animated: false)
        } else {
            imageViewContainer.image = UIImage(named: "light")
            
            self.overrideUserInterfaceStyle = .light
            self.imageViewContainer.overrideUserInterfaceStyle = .light
            self.switcher.overrideUserInterfaceStyle = .light
            
            switcher.setOn(false, animated: false)
        }
    }
    
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            UIView.animate(withDuration: 5, delay: 0.2, options: .curveEaseIn) {
                self.imageViewContainer.image = UIImage(named: "dark")
                self.overrideUserInterfaceStyle = .dark
                self.imageViewContainer.overrideUserInterfaceStyle = .dark
                self.switcher.overrideUserInterfaceStyle = .dark
            } completion: { _ in
                self.state.set(true, forKey: "state")
            }
        } else {
            UIView.animate(withDuration: 5, delay: 0.2, options: .curveEaseIn) {
                self.imageViewContainer.image = UIImage(named: "light")
                self.overrideUserInterfaceStyle = .light
                self.imageViewContainer.overrideUserInterfaceStyle = .light
                self.switcher.overrideUserInterfaceStyle = .light
            } completion: { _ in
                self.state.set(false, forKey: "state")
            }
        }
    }
    
}

