//
//  Feature_1_A_1_View.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import SwiftUI

struct Feature_1_A_1_View: ViewControllable {
    var holder: NavStackHolder
    
    init(holder: NavStackHolder = NavStackHolder()) {
        self.holder = holder
        print("\(type(of: self)) \(#function)")
    }
    
    func viewWillAppear(_ viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        
        print("\(type(of: self)) \(#function)")
    }
    
    func viewWillDisappear(_ viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(false, animated: false)
        
        print("\(type(of: self)) \(#function)")
    }
    
    var body: some View {
        VStack {
            Text("Feature 1 A 1")
            Button {
                navigateToRoot()
            } label: {
                Text("simulate exit")
            }
        }
    }
    
    func navigateToRoot() {
        guard let viewControlelr = holder.viewController else { return }
        viewControlelr.navigationController?.popToRootViewController(animated: true)
    }
}
