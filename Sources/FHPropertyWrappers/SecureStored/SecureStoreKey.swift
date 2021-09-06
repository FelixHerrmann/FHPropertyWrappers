import Foundation

/// The key for the secure stored property.
///
/// Extend this with type properties for convenience.
public struct SecureStoreKey {
    
    internal let _value: String
    
    public init(_ value: String) {
        self._value = value
    }
}

extension SecureStoreKey: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self._value = value
    }
}

extension SecureStoreKey: CustomStringConvertible {
    
    public var description: String {
        return _value
    }
}
