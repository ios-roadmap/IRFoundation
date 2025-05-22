//
//  Binding+EXT.swift
//  IRFoundation
//
//  Created by Ömer Faruk Öztürk on 22.05.2025.
//

import SwiftUI

public extension Binding where Value == Bool {
    
    /// Creates a `Binding<Bool>` from a `Binding<Optional<T>>`.
    ///
    /// Returns `true` if the value is non-nil, `false` otherwise.
    /// Setting the boolean to `false` will set the wrapped optional to `nil`.
    ///
    /// Useful when you want to use `.sheet(isPresented:)` or similar APIs
    /// but your source of truth is an optional model.
    ///
    /// ### Example usage:
    /// ```swift
    /// @State private var selectedItem: Item?
    ///
    /// var body: some View {
    ///     Button("Show Detail") {
    ///         selectedItem = Item(id: 1)
    ///     }
    ///     .sheet(isPresented: .init(ifNotNil: $selectedItem)) {
    ///         if let item = selectedItem {
    ///             DetailView(item: item)
    ///         }
    ///     }
    /// }
    /// ```
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}

