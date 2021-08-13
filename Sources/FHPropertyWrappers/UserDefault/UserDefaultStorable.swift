import Foundation

/// Add the capability to store the object inside the **UserDefaults**.
public protocol UserDefaultStorable {
    
    /// Store the value inside the `store`.
    static func store(value: Self, in store: UserDefaults, key: UserDefaultKey) throws
    
    /// Get the value from the `store`.
    static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Self?
}

extension UserDefaultStorable {
    
    /// A convenience method which can be called on the instance directly.
    public func store(in store: UserDefaults, key: UserDefaultKey) throws {
        try Self.store(value: self, in: store, key: key)
    }
}
