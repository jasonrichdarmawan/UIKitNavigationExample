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
                navigateToFeature_1()
            } label: {
                Text("Navigate to Feature 1")
            }
            
            Button {
                navigateToFeature_2()
            } label: {
                Text("Navigate to Feature 2")
            }
            
            Button {
                presentFeature_2()
            } label: {
                Text("Present Feature 2")
            }
            
            Button {
                fullScreenFeature_3()
            } label: {
                Text("Full Screen Feature 3")
            }
        }
    }
    
    func navigateToFeature_1() {
        guard let viewController = holder.viewController else { return }
        let view = Feature_1_View()
        
        // enable pop gesture when navigation bar is hidden.
        viewController.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        viewController.navigationController?.pushViewController(view.viewController, animated: true)
    }
    
    func navigateToFeature_2() {
        guard let viewController = holder.viewController else { return }
        let view = Feature_2_View()
        viewController.navigationController?.pushViewController(view.viewController, animated: true)
    }
    
    func presentFeature_2() {
        guard let viewController = holder.viewController else { return }
        let view = Feature_2_View()
        viewController.present(view.viewController, animated: true)
    }
    
    func fullScreenFeature_3() {
        guard let viewController = holder.viewController else { return }
        let view = Feature_3_View()
        let nextViewController = view.viewController
        nextViewController.modalPresentationStyle = .fullScreen
        nextViewController.modalTransitionStyle = .crossDissolve
        viewController.present(nextViewController, animated: true)
    }
}
