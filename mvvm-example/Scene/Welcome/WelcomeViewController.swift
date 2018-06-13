//
//  WelcomeViewController.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
  
  @IBOutlet weak var searchButton:UIButton!
  @IBOutlet weak var searchTextField:UITextField!
  
  var router:WelcomeRouterType!
  var vm:WelcomeViewModelType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    setupViewModel()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension WelcomeViewController {
  
  private func setupView() {

  }
  
  @IBAction
  private func searchButtonPress() {
    if let text = searchTextField.text, !text.isEmpty {
      router.perform(.results, from: self, with:text)
    }
  }
  
  private func setupViewModel() { }
}

