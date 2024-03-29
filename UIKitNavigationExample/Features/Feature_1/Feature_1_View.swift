//
//  Feature1View.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import SwiftUI

struct Feature_1_View: ViewControllable {
    var holder: NavStackHolder
    
    @StateObject private var feature_1_ViewModel: Feature_1_ViewModel
    
    init(holder: NavStackHolder = NavStackHolder(), feature_1_ViewModel: Feature_1_ViewModel = Feature_1_ViewModel()) {
        self.holder = holder
        self._feature_1_ViewModel = StateObject(wrappedValue: feature_1_ViewModel)
        print("\(type(of: self)) \(#function)")
    }
    
    var body: some View {
        VStack {
            Text("Feature 1")
            Text("departure \(feature_1_ViewModel.departure?.name ?? "")")
            Button {
                feature_1_ViewModel.departure = Station(name: "Lebak Bulus Grab")
            } label: {
                Text("set departure")
            }
            Button {
                _ = navigateToFeature_1_A()
            } label: {
                Text("Go to Feature 1 A")
            }
        }    }
}

extension Feature_1_View {
    func viewDidAppear(_ viewController: UIViewController) {
        // enable pop gesture when navigation bar is hidden.
        viewController.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension Feature_1_View {
    func navigateToFeature_1_A() -> Bool {
        guard let viewController = holder.viewController else { return false }
        let view = Feature_1_A_View(feature_1_ViewModel: feature_1_ViewModel)
        viewController.navigationController?.pushViewController(view.viewController, animated: true)
        return true
    }
}

#if DEBUG
struct Feature_1_View_Previews: PreviewProvider {
    static var previews: some View {
        Feature_1_View()
    }
}
#endif
