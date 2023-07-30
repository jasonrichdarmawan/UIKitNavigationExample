//
//  NavStackHolder.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import SwiftUI

final class NavStackHolder {
    weak var viewController: UIViewController?
}

protocol ViewControllable: View {
    var holder: NavStackHolder { get set }
    
    func loadView()
    func viewDidLoad(_ viewController: UIViewController)
    func viewWillAppear(_ viewController: UIViewController)
    func viewDidAppear(_ viewController: UIViewController)
    func viewWillDisappear(_ viewController: UIViewController)
}

extension ViewControllable {
    var viewController: UIViewController {
        let viewController = HostingController(rootView: self)
        self.holder.viewController = viewController
        return viewController
    }
    
    func loadView() {}
    func viewDidLoad(_ viewController: UIViewController) {}
    func viewWillAppear(_ viewController: UIViewController) {}
    func viewDidAppear(_ viewController: UIViewController) {}
    func viewWillDisappear(_ viewController: UIViewController) {}
}

final class HostingController<ContentView>: UIHostingController<ContentView> where ContentView: ViewControllable {
    override func loadView() {
        super.loadView()
        rootView.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.viewDidLoad(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.viewWillAppear(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rootView.viewDidAppear(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        rootView.viewWillDisappear(self)
    }
}
