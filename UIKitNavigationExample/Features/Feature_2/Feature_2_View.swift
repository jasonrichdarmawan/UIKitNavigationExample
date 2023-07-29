//
//  Feature_2_View.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import SwiftUI

struct Feature_2_View: ViewControllable {
    var holder: NavStackHolder
    
    @StateObject private var feature_2_ViewModel: Feature_2_ViewModel
    
    init(holder: NavStackHolder = NavStackHolder(), feature_2_ViewModel: Feature_2_ViewModel = Feature_2_ViewModel()) {
        self.holder = holder
        self._feature_2_ViewModel = StateObject(wrappedValue: feature_2_ViewModel)
        print("\(type(of: self)) \(#function)")
    }
    
    var body: some View {
        VStack {
            Text("Feature 2")
            Text("departure \(feature_2_ViewModel.departure?.name ?? "")")
            Button {
                feature_2_ViewModel.departure = Station(name: "Lebak Bulus Grab")
            } label: {
                Text("set departure")
            }
        }
    }
}
