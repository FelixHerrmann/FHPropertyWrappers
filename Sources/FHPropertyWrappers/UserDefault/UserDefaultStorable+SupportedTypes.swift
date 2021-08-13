import Foundation

// MARK: - UserDefaultStorable + Bool

extension Bool: UserDefaultStorable {
    
    public static func store(value: Bool, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Bool? {
        return store.value(forKey: key._value) as? Bool
    }
}

// MARK: - UserDefaultStorable + NSNumber

extension NSNumber: UserDefaultStorable {
    
    public static func store(value: NSNumber, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Self? {
        return store.value(forKey: key._value) as? Self
    }
}


// MARK: - UserDefaultStorable + Int

extension Int: UserDefaultStorable {
    
    public static func store(value: Int, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Int? {
        return store.value(forKey: key._value) as? Int
    }
}


// MARK: - UserDefaultStorable + Int8

extension Int8: UserDefaultStorable {
    
    public static func store(value: Int8, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Int8? {
        return store.value(forKey: key._value) as? Int8
    }
}


// MARK: - UserDefaultStorable + Int16

extension Int16: UserDefaultStorable {
    
    public static func store(value: Int16, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Int16? {
        return store.value(forKey: key._value) as? Int16
    }
}


// MARK: - UserDefaultStorable + Int32

extension Int32: UserDefaultStorable {
    
    public static func store(value: Int32, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Int32? {
        return store.value(forKey: key._value) as? Int32
    }
}


// MARK: - UserDefaultStorable + Int64

extension Int64: UserDefaultStorable {
    
    public static func store(value: Int64, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Int64? {
        return store.value(forKey: key._value) as? Int64
    }
}


// MARK: - UserDefaultStorable + UInt

extension UInt: UserDefaultStorable {
    
    public static func store(value: UInt, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> UInt? {
        return store.value(forKey: key._value) as? UInt
    }
}


// MARK: - UserDefaultStorable + UInt8

extension UInt8: UserDefaultStorable {
    
    public static func store(value: UInt8, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> UInt8? {
        return store.value(forKey: key._value) as? UInt8
    }
}


// MARK: - UserDefaultStorable + UInt16

extension UInt16: UserDefaultStorable {
    
    public static func store(value: UInt16, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> UInt16? {
        return store.value(forKey: key._value) as? UInt16
    }
}


// MARK: - UserDefaultStorable + UInt32

extension UInt32: UserDefaultStorable {
    
    public static func store(value: UInt32, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> UInt32? {
        return store.value(forKey: key._value) as? UInt32
    }
}


// MARK: - UserDefaultStorable + UInt64

extension UInt64: UserDefaultStorable {
    
    public static func store(value: UInt64, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> UInt64? {
        return store.value(forKey: key._value) as? UInt64
    }
}


// MARK: - UserDefaultStorable + Float

extension Float: UserDefaultStorable {
    
    public static func store(value: Float, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Float? {
        return store.value(forKey: key._value) as? Float
    }
}


#if os(macOS) && arch(x86_64)
// MARK: - UserDefaultStorable + Float80

extension Float80: UserDefaultStorable {
    
    public static func store(value: Float80, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Float80? {
        return store.value(forKey: key._value._value) as? Float80
    }
}
#endif


// MARK: - UserDefaultStorable + Double

extension Double: UserDefaultStorable {
    
    public static func store(value: Double, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Double? {
        return store.value(forKey: key._value) as? Double
    }
}


// MARK: - UserDefaultStorable + NSString

extension NSString: UserDefaultStorable {
    
    public static func store(value: NSString, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Self? {
        return store.value(forKey: key._value) as? Self
    }
}


// MARK: - UserDefaultStorable + String

extension String: UserDefaultStorable {
    
    public static func store(value: String, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> String? {
        return store.value(forKey: key._value) as? String
    }
}


// MARK: - UserDefaultStorable + NSDate

extension NSDate: UserDefaultStorable {
    
    public static func store(value: NSDate, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Self? {
        return store.value(forKey: key._value) as? Self
    }
}


// MARK: - UserDefaultStorable + Date

extension Date: UserDefaultStorable {
    
    public static func store(value: Date, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Date? {
        return store.value(forKey: key._value) as? Date
    }
}


// MARK: - UserDefaultStorable + NSURL

extension NSURL: UserDefaultStorable {
    
    public static func store(value: NSURL, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value as URL, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Self? {
        return store.url(forKey: key._value) as? Self
    }
}


// MARK: - UserDefaultStorable + URL

extension URL: UserDefaultStorable {
    
    public static func store(value: URL, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> URL? {
        return store.url(forKey: key._value)
    }
}


// MARK: - UserDefaultStorable + NSData

extension NSData: UserDefaultStorable {
    
    public static func store(value: NSData, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Self? {
        return store.value(forKey: key._value) as? Self
    }
}


// MARK: - UserDefaultStorable + Data

extension Data: UserDefaultStorable {
    
    public static func store(value: Data, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Data? {
        return store.value(forKey: key._value) as? Data
    }
}


// MARK: - UserDefaultStorable + Array

extension Array: UserDefaultStorable where Element: UserDefaultStorable {
    
    public static func store(value: Array, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Array? {
        return store.value(forKey: key._value) as? Array
    }
}


// MARK: - UserDefaultStorable + Dictionary

extension Dictionary: UserDefaultStorable where Key: UserDefaultStorable, Value: UserDefaultStorable {
    
    public static func store(value: Dictionary, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Dictionary? {
        return store.value(forKey: key._value) as? Dictionary
    }
}


// MARK: - UserDefaultStorable + Optional

extension Optional: UserDefaultStorable where Wrapped: UserDefaultStorable {
    
    public static func store(value: Optional<Wrapped>, in store: UserDefaults, key: UserDefaultKey) throws {
        switch value {
        case .some(let storable):
            try storable.store(in: store, key: key)
        case .none:
            store.removeObject(forKey: key._value)
        }
    }
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Optional<Wrapped>? {
        return store.value(forKey: key._value) as? Optional<Wrapped>
    }
}


// MARK: - UserDefaultStorable + Codable implementation

extension Encodable where Self: UserDefaultStorable {
    
    public static func store(value: Self, in store: UserDefaults, key: UserDefaultKey) throws {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(value)
        store.set(data, forKey: key._value)
    }
}

extension Decodable where Self: UserDefaultStorable {
    
    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Self? {
        guard let data = store.value(forKey: key._value) as? Data else { return nil }
        let decoder = PropertyListDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}


// MARK: - UserDefaultStorable + RawRepresentable implementation

extension RawRepresentable where RawValue: UserDefaultStorable {

    public static func store(value: Self, in store: UserDefaults, key: UserDefaultKey) throws {
        store.set(value.rawValue, forKey: key._value)
    }

    public static func read(in store: UserDefaults, key: UserDefaultKey) throws -> Self? {
        guard let rawValue = store.value(forKey: key._value) as? RawValue else { return nil }
        return Self(rawValue: rawValue)
    }
}
