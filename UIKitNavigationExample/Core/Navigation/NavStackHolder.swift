//
//  NavStackHolder.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import SwiftUI

final class NavStackHolder {
    public weak var viewController: UIViewController?
    
    public init() {}
}

protocol ViewControllable: View {
    var holder: NavStackHolder { get set }
    
    func loadView()
    func viewWillAppear(_ viewController: UIViewController)
    func viewWillDisappear(_ viewController: UIViewController)
}

extension ViewControllable {
    var viewController: UIViewController {
        let viewController = HostingController(rootView: self)
        self.holder.viewController = viewController
        return viewController
    }
    
    func loadView() {}
    func viewWillAppear(_ viewController: UIViewController) {}
    func viewWillDisappear(_ viewController: UIViewController) {}
}

final class HostingController<ContentView>: UIHostingController<ContentView> where ContentView: ViewControllable {
    public override func loadView() {
        super.loadView()
        self.rootView.loadView()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rootView.viewWillAppear(self)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.rootView.viewWillDisappear(self)
    }
}
