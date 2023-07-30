//
//  MainView.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import SwiftUI

struct MainView: ViewControllable {
    var holder: NavStackHolder
    
    init(holder: NavStackHolder = NavStackHolder()) {
        self.holder = holder
        print("\(type(of: self)) \(#function)")
    }
    
    var body: some View {
        List {
            Button {
                _ = navigateToFeature_1()
            } label: {
                Text("Navigate to Feature 1")
            }
            
            Button {
                _ = navigateToFeature_2()
            } label: {
                Text("Navigate to Feature 2")
            }
            
            Button {
                _ = presentFeature_2()
            } label: {
                Text("Present Feature 2")
            }
            
            Button {
                _ = fullScreenFeature_3()
            } label: {
                Text("Full Screen Feature 3")
            }
        }
    }
}

extension MainView {
    func viewDidAppear(_ viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
    
extension MainView {
    func navigateToFeature_1() -> Bool {
        guard let viewController = holder.viewController else { return false }
        let view = Feature_1_View()
        viewController.navigationController?.pushViewController(view.viewController, animated: true)
        
        return true
    }
    
    func navigateToFeature_2() -> Bool {
        guard let viewController = holder.viewController else { return false }
        let view = Feature_2_View()
        viewController.navigationController?.pushViewController(view.viewController, animated: true)
        
        return true
    }
    
    func presentFeature_2() -> Bool {
        guard let viewController = holder.viewController else { return false }
        let view = Feature_2_View()
        viewController.present(view.viewController, animated: true)
        
        return true
    }
    
    func fullScreenFeature_3() -> Bool {
        guard let viewController = holder.viewController else { return false }
        let view = Feature_3_View()
        let nextViewController = view.viewController
        nextViewController.modalPresentationStyle = .fullScreen
        nextViewController.modalTransitionStyle = .crossDissolve
        viewController.present(nextViewController, animated: true)
        
        return true
    }
}
