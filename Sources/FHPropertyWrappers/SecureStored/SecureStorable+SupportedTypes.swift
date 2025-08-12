import Foundation

// MARK: - Base Types

extension Bool: SecureStorable { }

extension Int: SecureStorable { }
extension Int8: SecureStorable { }
extension Int16: SecureStorable { }
extension Int32: SecureStorable { }
extension Int64: SecureStorable { }

extension UInt: SecureStorable { }
extension UInt8: SecureStorable { }
extension UInt16: SecureStorable { }
extension UInt32: SecureStorable { }
extension UInt64: SecureStorable { }

extension Float: SecureStorable { }
extension Double: SecureStorable { }

extension Date: SecureStorable { }
extension URL: SecureStorable { }

// MARK: - Collections

extension String: SecureStorable {
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> String? {
        let query = _keychainQuery(key: key, accessibility: accessibility)
        guard let data = try _keychainGet(query: query) else { return nil }
        return String(bytes: data, encoding: .utf8)
    }
    
    public static func write(value: String, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        let data = Data(value.utf8)
        let query = _keychainQuery(key: key, accessibility: accessibility)
        try _keychainSet(value: data, query: query)
    }
}

extension Data: SecureStorable {
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> Data? {
        let query = _keychainQuery(key: key, accessibility: accessibility)
        return try _keychainGet(query: query)
    }
    
    public static func write(value: Data, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        let query = _keychainQuery(key: key, accessibility: accessibility)
        try _keychainSet(value: value, query: query)
    }
}

extension Array: SecureStorable where Element: Codable {
    public static var defaultStoredValue: [Element] {
        []
    }
}

extension Dictionary: SecureStorable where Key: Codable, Value: Codable {
    public static var defaultStoredValue: [Key: Value] {
        return [:]
    }
}

// MARK: - Wrapper

extension Optional: SecureStorable where Wrapped: SecureStorable {
    public static var defaultStoredValue: Wrapped? {
        return .none
    }
    
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> Wrapped?? {
        return try Wrapped.read(key: key, accessibility: accessibility)
    }
    
    public static func write(value: Wrapped?, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        switch value {
        case .some(let secureStorable):
            try secureStorable.write(key: key, accessibility: accessibility)
        case .none:
            let query = _keychainQuery(key: key, accessibility: accessibility)
            try _keychainDelete(query: query)
        }
    }
}

// MARK: - Protocols

extension SecureStorable where Self: Codable {
    /// Read the value from the **Keychain**.
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> Self? {
        let query = _keychainQuery(key: key, accessibility: accessibility)
        guard let data = try _keychainGet(query: query) else { return nil }
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
    
    /// Write the value to the **Keychain**.
    public static func write(value: Self, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(value)
        let query = _keychainQuery(key: key, accessibility: accessibility)
        try _keychainSet(value: data, query: query)
    }
}

extension SecureStorable where Self: RawRepresentable, RawValue: SecureStorable {
    /// Read the value from the **Keychain**.
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> Self? {
        guard let rawValue = try RawValue.read(key: key, accessibility: accessibility) else { return nil }
        return Self(rawValue: rawValue)
    }
    
    /// Write the value to the **Keychain**.
    public static func write(value: Self, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        try value.rawValue.write(key: key, accessibility: accessibility)
    }
}
