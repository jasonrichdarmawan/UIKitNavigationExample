//
//  Feature1ViewModel.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import Foundation

final class Feature_1_ViewModel: ObservableObject {
    var id: UUID
    
    @Published var departure: Station?
    
    init(id: UUID = UUID(), departure: Station? = nil) {
        self.id = id
        self.departure = departure
        print("\(type(of: self)) \(#function) \(id.uuidString)")
    }
    
    deinit { print("\(type(of: self)) \(#function) \(id.uuidString)") }
}
