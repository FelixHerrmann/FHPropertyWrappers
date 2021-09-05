import Foundation


// MARK: - Bool + Storable

extension Bool: Storable {
    
    public static var defaultStoredValue: Bool {
        return Bool()
    }
    
    public static func write(value: Bool, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Bool? {
        return store.value(forKey: key._value) as? Bool
    }
}


// MARK: - Int + Storable

extension Int: Storable {
    
    public static var defaultStoredValue: Int {
        return Int()
    }
    
    public static func write(value: Int, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Int? {
        return store.value(forKey: key._value) as? Int
    }
}


// MARK: - Int8 + Storable

extension Int8: Storable {
    
    public static var defaultStoredValue: Int8 {
        return Int8()
    }
    
    public static func write(value: Int8, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Int8? {
        return store.value(forKey: key._value) as? Int8
    }
}


// MARK: - Int16 + Storable

extension Int16: Storable {
    
    public static var defaultStoredValue: Int16 {
        return Int16()
    }
    
    public static func write(value: Int16, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Int16? {
        return store.value(forKey: key._value) as? Int16
    }
}


// MARK: - Int32 + Storable

extension Int32: Storable {
    
    public static var defaultStoredValue: Int32 {
        return Int32()
    }
    
    public static func write(value: Int32, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Int32? {
        return store.value(forKey: key._value) as? Int32
    }
}


// MARK: - Int64 + Storable

extension Int64: Storable {
    
    public static var defaultStoredValue: Int64 {
        return Int64()
    }
    
    public static func write(value: Int64, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Int64? {
        return store.value(forKey: key._value) as? Int64
    }
}


// MARK: - UInt + Storable

extension UInt: Storable {
    
    public static var defaultStoredValue: UInt {
        return UInt()
    }
    
    public static func write(value: UInt, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> UInt? {
        return store.value(forKey: key._value) as? UInt
    }
}


// MARK: - UInt8 + Storable

extension UInt8: Storable {
    
    public static var defaultStoredValue: UInt8 {
        return UInt8()
    }
    
    public static func write(value: UInt8, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> UInt8? {
        return store.value(forKey: key._value) as? UInt8
    }
}


// MARK: - UInt16 + Storable

extension UInt16: Storable {
    
    public static var defaultStoredValue: UInt16 {
        return UInt16()
    }
    
    public static func write(value: UInt16, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> UInt16? {
        return store.value(forKey: key._value) as? UInt16
    }
}


// MARK: - UInt32 + Storable

extension UInt32: Storable {
    
    public static var defaultStoredValue: UInt32 {
        return UInt32()
    }
    
    public static func write(value: UInt32, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> UInt32? {
        return store.value(forKey: key._value) as? UInt32
    }
}


// MARK: - UInt64 + Storable

extension UInt64: Storable {
    
    public static var defaultStoredValue: UInt64 {
        return UInt64()
    }
    
    public static func write(value: UInt64, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> UInt64? {
        return store.value(forKey: key._value) as? UInt64
    }
}


// MARK: - Float + Storable

extension Float: Storable {
    
    public static var defaultStoredValue: Float {
        return Float()
    }
    
    public static func write(value: Float, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Float? {
        return store.value(forKey: key._value) as? Float
    }
}


// MARK: - Double + Storable

extension Double: Storable {
    
    public static var defaultStoredValue: Double {
        return Double()
    }
    
    public static func write(value: Double, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Double? {
        return store.value(forKey: key._value) as? Double
    }
}


// MARK: - String + Storable

extension String: Storable {
    
    public static var defaultStoredValue: String {
        return String()
    }
    
    public static func write(value: String, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> String? {
        return store.value(forKey: key._value) as? String
    }
}


// MARK: - Date + Storable

extension Date: Storable {
    
    public static var defaultStoredValue: Date {
        return Date()
    }
    
    public static func write(value: Date, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Date? {
        return store.value(forKey: key._value) as? Date
    }
}


// MARK: - URL + Storable

extension URL: Storable {
    
    public static var defaultStoredValue: URL {
        return URL(fileURLWithPath: "")
    }
    
    public static func write(value: URL, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> URL? {
        return store.url(forKey: key._value)
    }
}


// MARK: - Data + Storable

extension Data: Storable {
    
    public static var defaultStoredValue: Data {
        return Data()
    }
    
    public static func write(value: Data, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Data? {
        return store.value(forKey: key._value) as? Data
    }
}


// MARK: - Array + Storable

extension Array: Storable where Element: Storable {
    
    public static var defaultStoredValue: Array<Element> {
        return []
    }
    
    public static func write(value: Array, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Array? {
        return store.value(forKey: key._value) as? Array
    }
}


// MARK: - Dictionary + Storable

extension Dictionary: Storable where Key: Storable, Value: Storable {
    
    public static var defaultStoredValue: Dictionary<Key, Value> {
        return [:]
    }
    
    public static func write(value: Dictionary, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Dictionary? {
        return store.value(forKey: key._value) as? Dictionary
    }
}


// MARK: - Optional + Storable

extension Optional: Storable where Wrapped: Storable {
    
    public static var defaultStoredValue: Optional<Wrapped> {
        return .none
    }
    
    public static func write(value: Optional<Wrapped>, in store: UserDefaults, key: StoreKey) throws {
        switch value {
        case .some(let storable):
            try storable.write(in: store, key: key)
        case .none:
            store.removeObject(forKey: key._value)
        }
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Optional<Wrapped>? {
        return store.value(forKey: key._value) as? Optional<Wrapped>
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
