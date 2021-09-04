import Foundation

/// The key for the stored property.
///
/// Extend this with type properties for convenience.
public struct StoreKey {
    
    internal let _value: String
    
    public init(_ value: String) {
        self._value = value
    }
}

extension StoreKey: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self._value = value
    }
}

extension StoreKey: CustomStringConvertible {
    
    public var description: String {
        return _value
    }
}
