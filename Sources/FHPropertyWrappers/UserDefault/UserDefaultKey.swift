import Foundation

/// The key for the stored value.
///
/// Extend this with type properties for convenience.
public struct UserDefaultKey {
    
    internal let _value: String
    
    public init(_ value: String) {
        self._value = value
    }
}

extension UserDefaultKey: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self._value = value
    }
}

extension UserDefaultKey: CustomStringConvertible {
    
    public var description: String {
        return _value
    }
}
