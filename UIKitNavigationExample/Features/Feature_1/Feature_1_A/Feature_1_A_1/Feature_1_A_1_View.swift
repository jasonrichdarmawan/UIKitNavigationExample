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
    
    var body: some View {
        VStack {
            Text("Feature 1 A 1")
            Button {
                _ = navigateToRoot()
            } label: {
                Text("simulate exit")
            }
        }
    }
}

extension Feature_1_A_1_View {
    func navigateToRoot() -> Bool {
        guard let viewControlelr = holder.viewController else { return false }
        viewControlelr.navigationController?.popToRootViewController(animated: true)
        return true
    }
}
