//
//  LoadingViewController.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 26.08.2021.
//

import UIKit

protocol ActionHandler {
    var action: (() -> Void)? { get set }
}

class LoadingViewController: UIViewController,  ActionHandler { 
    
    var action: (() -> Void)?
    
    override func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.action?()
        })
    }
}
