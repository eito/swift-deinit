//
//  ViewController.swift
//  deinit
//
//  Created by Eric Ito on 9/5/16.
//  Copyright © 2016 Eric Ito. All rights reserved.
//

import UIKit

/*
 `ThingViewController` is assigned a `Thing`
 
 `Thing` is initialized with a `ThingViewController` and holds on to it weakly
 to prevent a retain cycle. 
 
 After `deinit` for `ThingViewController` gets called, the `deinit` for `Thing`
 gets called -- as expected -- however, inside `deinit` for `Thing`, the weak reference
 to `ThingViewController` has been nil'd out.
 
 `Thing` being an `NSObject` or pure Swift object makes no difference
 */

class Thing: NSObject {
    
    weak var viewController: ThingViewController?
    
    init(thingVC: ThingViewController) {
        viewController = thingVC
    }
    
    deinit {
        
        // Why is this nil here?
        //
        if viewController == nil {
            print("viewController is nil in \(#function)")
        }
    }
}

class ThingViewController: UIViewController {
    
    var thing: Thing!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Thing"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(done))
    }
    
    func done() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    deinit {
        
        print("ThingViewController - \(#function)")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Deinit Test"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "GO", style: .Plain, target: self, action: #selector(go))
    }

    func go() {
        
        let thingVC = ThingViewController()
        thingVC.thing = Thing(thingVC: thingVC)
        
        let nav = UINavigationController(rootViewController: thingVC)
        presentViewController(nav, animated: true, completion: nil)
    }
}

