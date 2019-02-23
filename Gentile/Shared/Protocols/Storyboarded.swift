//
//  Storyboarded.swift
//  Gentile
//
//  Created by Matheus Costa on 22/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import UIKit

/// Protocol to instantiate view controllers and no longer need the storyboard
/// to manage the creation of view controllers
protocol Storyboarded {
    /// Instance a new view controller.
    ///
    /// - Returns: Specific UIViewController instance.
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {

    /// Default implementation.
    /// Instantiate a view controller based on the class name and the
    /// Storyboard ID, which must be the same to work.
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: id, bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }

}
