import Foundation

// MARK: - Base Types

extension Bool: RawStorable {
    public static var defaultStoredValue: Bool {
        return Bool()
    }
}

extension Int: RawStorable {
    public static var defaultStoredValue: Int {
        return Int()
    }
}

extension Int8: RawStorable {
    public static var defaultStoredValue: Int8 {
        return Int8()
    }
}

extension Int16: RawStorable {
    public static var defaultStoredValue: Int16 {
        return Int16()
    }
}

extension Int32: RawStorable {
    public static var defaultStoredValue: Int32 {
        return Int32()
    }
}

extension Int64: RawStorable {
    public static var defaultStoredValue: Int64 {
        return Int64()
    }
}

extension UInt: RawStorable {
    public static var defaultStoredValue: UInt {
        return UInt()
    }
}

extension UInt8: RawStorable {
    public static var defaultStoredValue: UInt8 {
        return UInt8()
    }
}

extension UInt16: RawStorable {
    public static var defaultStoredValue: UInt16 {
        return UInt16()
    }
}

extension UInt32: RawStorable {
    public static var defaultStoredValue: UInt32 {
        return UInt32()
    }
}

extension UInt64: RawStorable {
    public static var defaultStoredValue: UInt64 {
        return UInt64()
    }
}

extension Float: RawStorable {
    public static var defaultStoredValue: Float {
        return Float()
    }
}

extension Double: RawStorable {
    public static var defaultStoredValue: Double {
        return Double()
    }
}

extension Date: RawStorable {
    public static var defaultStoredValue: Date {
        return Date()
    }
}

extension URL: RawStorable {
    public static var defaultStoredValue: URL {
        return URL(fileURLWithPath: "")
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> URL? {
        return store.url(forKey: key._value)
    }
    
    public static func write(value: URL, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
}

// MARK: - Collections

extension String: RawStorable {
    public static var defaultStoredValue: String {
        return String()
    }
}

extension Data: RawStorable {
    public static var defaultStoredValue: Data {
        return Data()
    }
}

extension Array: Storable where Element: RawStorable {
    public static var defaultStoredValue: [Element] {
        return []
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Self? {
        return store.value(forKey: key._value) as? Self
    }
    
    public static func write(value: Array, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
}

extension Dictionary: Storable where Key: RawStorable, Value: RawStorable {
    public static var defaultStoredValue: [Key: Value] {
        return [:]
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Self? {
        return store.value(forKey: key._value) as? Self
    }
    
    public static func write(value: Dictionary, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
}

// MARK: - Wrapper

extension Optional: Storable where Wrapped: Storable {
    public static var defaultStoredValue: Wrapped? {
        return .none
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Wrapped?? {
        return try Wrapped.read(in: store, key: key)
    }
    
    public static func write(value: Wrapped?, in store: UserDefaults, key: StoreKey) throws {
        switch value {
        case .some(let storable):
            try storable.write(in: store, key: key)
        case .none:
            store.removeObject(forKey: key._value)
        }
    }
}

// MARK: - Protocols

extension Storable where Self: Codable {
    /// Read the value from the `store`.
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Self? {
        guard let data = store.value(forKey: key._value) as? Data else { return nil }
        let decoder = PropertyListDecoder()
        return try decoder.decode(Self.self, from: data)
    }
    
    /// Write the value to the `store`.
    public static func write(value: Self, in store: UserDefaults, key: StoreKey) throws {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(value)
        store.set(data, forKey: key._value)
    }
}

extension Storable where Self: RawRepresentable, RawValue: Storable {
    /// Read the value from the `store`.
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Self? {
        guard let rawValue = try RawValue.read(in: store, key: key) else { return nil }
        return Self(rawValue: rawValue)
    }
    
    /// Write the value to the `store`.
    public static func write(value: Self, in store: UserDefaults, key: StoreKey) throws {
        try value.rawValue.write(in: store, key: key)
    }
}
