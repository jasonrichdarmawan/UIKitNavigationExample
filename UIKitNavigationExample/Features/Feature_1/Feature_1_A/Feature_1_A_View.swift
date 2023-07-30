//
//  Feature_1_A_View.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import SwiftUI

struct Feature_1_A_View: ViewControllable {
    var holder: NavStackHolder
    
    @ObservedObject private var feature_1_ViewModel: Feature_1_ViewModel
    @StateObject private var feature_1_A_ViewModel: Feature_1_A_ViewModel
    
    init(
        holder: NavStackHolder = NavStackHolder(),
        feature_1_ViewModel: Feature_1_ViewModel = Feature_1_ViewModel(),
        feature_1_A_ViewModel: Feature_1_A_ViewModel = Feature_1_A_ViewModel()
    ) {
        self.holder = holder
        self.feature_1_ViewModel = feature_1_ViewModel
        self._feature_1_A_ViewModel = StateObject(wrappedValue: feature_1_A_ViewModel)
        print("\(type(of: self)) \(#function)")
    }
    
    var body: some View {
        VStack {
            Text("Feature 1 A")
            Text("departure \(feature_1_ViewModel.departure?.name ?? "")")
            Text("current station \(feature_1_A_ViewModel.currentStation?.name ?? "")")
            Button {
                feature_1_A_ViewModel.currentStation = Station(name: "Fatmawati Indomaret Grab")
            } label: {
                Text("set current station")
            }
            Button {
                _ = navigateToFeature_1_A_1()
            } label: {
                Text("Go to Feature 1 A 1")
            }
        }
    }
    
    func navigateToFeature_1_A_1() -> Bool {
        guard let viewController = holder.viewController else { return false }
        let view = Feature_1_A_1_View()
        viewController.navigationController?.pushViewController(view.viewController, animated: true)
        
        return true
    }
}
