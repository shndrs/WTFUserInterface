//
//  UIViewController.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/4/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

extension UIViewController {
    public class func instantiate(from storyboard: UIStoryboard? = nil) -> Self {
        return get(storyboard: storyboard)
    }
    
    public class func instantiate(storyboard: StoryboardId) -> Self {
        return instantiate(from: UIStoryboard(name: storyboard.raw(), bundle: nil))
    }
       
    @discardableResult
    private class func get<T: UIViewController>(storyboard: UIStoryboard? = nil) -> T {
        let className = String(describing: self)
        var story = storyboard
        if story == nil {
            story = UIStoryboard(name: className, bundle: .main)
        }
        return story!.instantiateViewController(withIdentifier: className) as! T
    }
}
