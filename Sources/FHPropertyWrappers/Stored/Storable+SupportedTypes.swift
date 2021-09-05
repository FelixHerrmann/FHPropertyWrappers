import Foundation


// MARK: - Bool + Storable

extension Bool: RawStorable {
    
    public static var defaultStoredValue: Bool {
        return Bool()
    }
}


// MARK: - Int + RawStorable

extension Int: RawStorable {
    
    public static var defaultStoredValue: Int {
        return Int()
    }
}


// MARK: - Int8 + RawStorable

extension Int8: RawStorable {
    
    public static var defaultStoredValue: Int8 {
        return Int8()
    }
}


// MARK: - Int16 + RawStorable

extension Int16: RawStorable {
    
    public static var defaultStoredValue: Int16 {
        return Int16()
    }
}


// MARK: - Int32 + RawStorable

extension Int32: RawStorable {
    
    public static var defaultStoredValue: Int32 {
        return Int32()
    }
}


// MARK: - Int64 + RawStorable

extension Int64: RawStorable {
    
    public static var defaultStoredValue: Int64 {
        return Int64()
    }
}


// MARK: - UInt + RawStorable

extension UInt: RawStorable {
    
    public static var defaultStoredValue: UInt {
        return UInt()
    }
}


// MARK: - UInt8 + RawStorable

extension UInt8: RawStorable {
    
    public static var defaultStoredValue: UInt8 {
        return UInt8()
    }
}


// MARK: - UInt16 + RawStorable

extension UInt16: RawStorable {
    
    public static var defaultStoredValue: UInt16 {
        return UInt16()
    }
}


// MARK: - UInt32 + RawStorable

extension UInt32: RawStorable {
    
    public static var defaultStoredValue: UInt32 {
        return UInt32()
    }
}


// MARK: - UInt64 + RawStorable

extension UInt64: RawStorable {
    
    public static var defaultStoredValue: UInt64 {
        return UInt64()
    }
}


// MARK: - Float + RawStorable

extension Float: RawStorable {
    
    public static var defaultStoredValue: Float {
        return Float()
    }
}


// MARK: - Double + RawStorable

extension Double: RawStorable {
    
    public static var defaultStoredValue: Double {
        return Double()
    }
}


// MARK: - String + RawStorable

extension String: RawStorable {
    
    public static var defaultStoredValue: String {
        return String()
    }
}


// MARK: - Date + RawStorable

extension Date: RawStorable {
    
    public static var defaultStoredValue: Date {
        return Date()
    }
}


// MARK: - URL + RawStorable

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


// MARK: - Data + RawStorable

extension Data: RawStorable {
    
    public static var defaultStoredValue: Data {
        return Data()
    }
}


// MARK: - Array + Storable

extension Array: Storable where Element: RawStorable {
    
    public static var defaultStoredValue: Array<Element> {
        return []
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Array? {
        return store.value(forKey: key._value) as? Array
    }
    
    public static func write(value: Array, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
}


// MARK: - Dictionary + Storable

extension Dictionary: Storable where Key: RawStorable, Value: RawStorable {
    
    public static var defaultStoredValue: Dictionary<Key, Value> {
        return [:]
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Dictionary? {
        return store.value(forKey: key._value) as? Dictionary
    }
    
    public static func write(value: Dictionary, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
}


// MARK: - Optional + Storable

extension Optional: Storable where Wrapped: Storable {
    
    public static var defaultStoredValue: Optional<Wrapped> {
        return .none
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Optional<Wrapped>? {
        return try Wrapped.read(in: store, key: key)
    }
    
    public static func write(value: Optional<Wrapped>, in store: UserDefaults, key: StoreKey) throws {
        switch value {
        case .some(let storable):
            try storable.write(in: store, key: key)
        case .none:
            store.removeObject(forKey: key._value)
        }
    }
}


// MARK: - Storable + Codable implementation

extension Storable where Self: Codable {
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Self? {
        guard let data = store.value(forKey: key._value) as? Data else { return nil }
        let decoder = PropertyListDecoder()
        return try decoder.decode(Self.self, from: data)
    }
    
    public static func write(value: Self, in store: UserDefaults, key: StoreKey) throws {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(value)
        store.set(data, forKey: key._value)
    }
}


// MARK: - Storable + RawRepresentable implementation

extension Storable where Self: RawRepresentable, RawValue: Storable {
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Self? {
        guard let rawValue = try RawValue.read(in: store, key: key) else { return nil }
        return Self(rawValue: rawValue)
    }
    
    public static func write(value: Self, in store: UserDefaults, key: StoreKey) throws {
        try value.rawValue.write(in: store, key: key)
    }
}
