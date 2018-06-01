//
//  WelcomeRouter.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import UIKit

enum WelcomeSegue {
  case search
}

protocol WelcomeRouterType {
  func perform(_ segue:WelcomeSegue, from source:WelcomeViewController)
}

struct WelcomeRouter:WelcomeRouterType {
  func perform(_ segue: WelcomeSegue, from source: WelcomeViewController) {
    print("Do something here")
  }
}
