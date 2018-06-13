//
//  ResultsViewController.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

  var vm:ResultsViewModel?
  
  static func instantiate() -> ResultsViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier:String(describing: self)) as! ResultsViewController
    return vc
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    vm?.fetch()
    //print("I need to do a search for - \(String(describing: vm?.searchTerm))")
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
