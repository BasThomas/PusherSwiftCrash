//
//  ViewController.swift
//  Pushertest
//
//  Created by Bas Broek on 21/11/2016.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import UIKit
import PusherSwift

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let pusher = Pusher(key: "", options: PusherClientOptions(host: .cluster("")))
    let channel = pusher.subscribe("session-status-1")
    
    let _ = channel.bind(eventName: "App\\Events\\SessionStatusUpdated") {
      guard let data = $0 as? [String: Any], let message = data["message"] as? String else { return }
      print(message)
    }
    
    pusher.connect()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

