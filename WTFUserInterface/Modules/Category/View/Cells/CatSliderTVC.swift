//
//  CatSliderTVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/13/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class CatSliderTVC: UITableViewCell, ReusableView {
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        
    }
    
}

extension CatSliderTVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
    
}
