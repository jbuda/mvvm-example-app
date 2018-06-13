//
//  WelcomeRouter.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import UIKit

enum WelcomeSegue {
  case results
}

protocol WelcomeRouterType {
  func perform(_ segue:WelcomeSegue, from source:WelcomeViewController, with parameters:Any?)
}

struct WelcomeRouter:WelcomeRouterType {
  func perform(_ segue: WelcomeSegue, from source: WelcomeViewController, with parameters:Any?) {
    let nc = WelcomeRouter.makeResultsViewController(with: parameters as! String)
    weak var weakSource = source
 
    source.present(nc, animated: true) {
      _ = weakSource?.navigationController?.popViewController(animated: false)
    }
  }
}

private extension WelcomeRouter {
  static func makeResultsViewController(with term:String) -> UINavigationController {
    let vc = ResultsViewController.instantiate()
    vc.vm = ResultsViewModel(with: term)
    let nc = UINavigationController(rootViewController: vc)
    
    return nc
  }
}
