//
//  Coordinator.swift
//  Gentile
//
//  Created by Matheus Costa on 22/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import UIKit

/// Base protocol to all coordinators of the app.
protocol Coordinator: AnyObject {
    /// Tree of coordinators dependent on this coordinator.
    var childCoordinators: [Coordinator] { get set }
    /// The base navigation controller of this coordinator.
    var navigationController: UINavigationController { get set }
    
    /// Must be called when coordinator is to start working.
    func start()
}
