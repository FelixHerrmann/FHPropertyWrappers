import Foundation

/// Add the capability to store the object inside the **Keychain**.
public protocol SecureStorable {
    
    /// Used as a default value for the `wrappedValue` attribute.
    static var defaultStoredValue: Self { get }
    
    /// Read the value from the **Keychain**.
    static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> Self?
    
    /// Write the value to the **Keychain**.
    static func write(value: Self, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws
}

extension SecureStorable {
    
    /// A convenience method which can be called on the instance directly.
    public func write(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        try Self.write(value: self, for: key, accessibility: accessibility)
    }
}
