import Foundation

/// Add the capability to store the object inside the **UserDefaults**.
public protocol Storable {
    
    /// Used as a default value for the `wrappedValue` attribute.
    static var defaultStoredValue: Self { get }
    
    /// Write the value to the `store`.
    static func write(value: Self, in store: UserDefaults, key: StoreKey) throws
    
    /// Read the value from the `store`.
    static func read(in store: UserDefaults, key: StoreKey) throws -> Self?
}

extension Storable {
    
    /// A convenience method which can be called on the instance directly.
    public func write(in store: UserDefaults, key: StoreKey) throws {
        try Self.write(value: self, in: store, key: key)
    }
}
