//
//  Launcher.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import UIKit

final class Launcher {
  static func launch(with window:UIWindow?) {
    if let nc = window?.rootViewController as? UINavigationController {
      let welcomeViewController = nc.viewControllers.first as! WelcomeViewController
      let vm = WelcomeViewModel()
      welcomeViewController.vm = vm
      welcomeViewController.router = WelcomeRouter()
    }
  }
}
