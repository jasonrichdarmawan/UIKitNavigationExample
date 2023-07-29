//
//  Feature_3_View.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import SwiftUI

struct Feature_3_View: ViewControllable {
    var holder: NavStackHolder
    
    @StateObject private var feature_3_ViewModel: Feature_3_ViewModel
    
    init(holder: NavStackHolder = NavStackHolder(), feature_3_ViewModel: Feature_3_ViewModel = Feature_3_ViewModel()) {
        self.holder = holder
        self._feature_3_ViewModel = StateObject(wrappedValue: feature_3_ViewModel)
        print("\(type(of: self)) \(#function)")
    }
    
    var body: some View {
        VStack {
            Text("Feature 3")
            Text("departure \(feature_3_ViewModel.departure?.name ?? "")")
            Button {
                feature_3_ViewModel.departure = Station(name: "Lebak Bulus Grab")
            } label: {
                Text("set departure")
            }
            Button {
                guard let viewController = holder.viewController else { return }
                viewController.dismiss(animated: true)
            } label: {
                Text("dismiss")
            }
        }
    }
}
