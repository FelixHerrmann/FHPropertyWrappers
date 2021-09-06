import Foundation


// MARK: - Bool + SecureStorable

extension Bool: SecureStorable { }


// MARK: - Int + SecureStorable

extension Int: SecureStorable { }


// MARK: - Int8 + SecureStorable

extension Int8: SecureStorable { }


// MARK: - Int16 + SecureStorable

extension Int16: SecureStorable { }


// MARK: - Int32 + SecureStorable

extension Int32: SecureStorable { }


// MARK: - Int64 + SecureStorable

extension Int64: SecureStorable { }


// MARK: - UInt + SecureStorable

extension UInt: SecureStorable { }


// MARK: - UInt8 + SecureStorable

extension UInt8: SecureStorable { }


// MARK: - UInt16 + SecureStorable

extension UInt16: SecureStorable { }


// MARK: - UInt32 + SecureStorable

extension UInt32: SecureStorable { }


// MARK: - UInt64 + SecureStorable

extension UInt64: SecureStorable { }


// MARK: - Float + SecureStorable

extension Float: SecureStorable { }


// MARK: - Double + SecureStorable

extension Double: SecureStorable { }


// MARK: - String + SecureStorable

extension String: SecureStorable {
    
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> String? {
        let query = _KeychainQuery(key: key, accessibility: accessibility)
        guard let data = try _KeychainGet(query: query) else { return nil }
        return String(decoding: data, as: UTF8.self)
    }
    
    public static func write(value: String, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        let data = Data(value.utf8)
        let query = _KeychainQuery(key: key, accessibility: accessibility)
        try _KeychainSet(value: data, query: query)
    }
}


// MARK: - Date + SecureStorable

extension Date: SecureStorable { }


// MARK: - URL + SecureStorable

extension URL: SecureStorable { }


// MARK: - Data + SecureStorable

extension Data: SecureStorable {
    
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> Data? {
        let query = _KeychainQuery(key: key, accessibility: accessibility)
        return try _KeychainGet(query: query)
    }
    
    public static func write(value: Data, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        let query = _KeychainQuery(key: key, accessibility: accessibility)
        try _KeychainSet(value: value, query: query)
    }
}


// MARK: - Array + SecureStorable

extension Array: SecureStorable where Element: Codable {
    
    public static var defaultStoredValue: Array<Element> {
        []
    }
}


// MARK: - Dictionary + SecureStorable

extension Dictionary: SecureStorable where Key: Codable, Value: Codable {
    
    public static var defaultStoredValue: Dictionary<Key, Value> {
        return [:]
    }
}


// MARK: - Optional + SecureStorable

extension Optional: SecureStorable where Wrapped: SecureStorable {
    
    public static var defaultStoredValue: Optional<Wrapped> {
        return .none
    }
    
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> Optional<Wrapped>? {
        return try Wrapped.read(key: key, accessibility: accessibility)
    }
    
    public static func write(value: Optional<Wrapped>, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        switch value {
        case .some(let secureStorable):
            try secureStorable.write(key: key, accessibility: accessibility)
        case .none:
            let query = _KeychainQuery(key: key, accessibility: accessibility)
            try _KeychainDelete(query: query)
        }
    }
}


// MARK: - SecureStorable + Codable implementation

extension SecureStorable where Self: Codable {
    
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> Self? {
        let query = _KeychainQuery(key: key, accessibility: accessibility)
        guard let data = try _KeychainGet(query: query) else { return nil }
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
    
    public static func write(value: Self, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(value)
        let query = _KeychainQuery(key: key, accessibility: accessibility)
        try _KeychainSet(value: data, query: query)
    }
}


// MARK: - SecureStorable + RawRepresentable implementation

extension SecureStorable where Self: RawRepresentable, RawValue: SecureStorable {
    
    public static func read(key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws -> Self? {
        guard let rawValue = try RawValue.read(key: key, accessibility: accessibility) else { return nil }
        return Self(rawValue: rawValue)
    }
    
    public static func write(value: Self, for key: SecureStoreKey, accessibility: SecureStoreAccessibility) throws {
        try value.rawValue.write(key: key, accessibility: accessibility)
    }
}
