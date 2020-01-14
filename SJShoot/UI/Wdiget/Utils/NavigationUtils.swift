//
//  NavigationConfigurator.swift
//  SJShoot
//
//  Created by MeteorShower on 2019/12/29.
//  Copyright © 2019 limo. All rights reserved.
//
// 修改标题栏属性
// nc.navigationBar.barTintColor = uiColor_ffe495
// nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    
    var configure: (UINavigationController) -> Void = { _ in}
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}
