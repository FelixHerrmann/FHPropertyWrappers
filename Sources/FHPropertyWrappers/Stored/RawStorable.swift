import Foundation

/// All types that conform to this protocol can be directly stored in the **UserDefaults**.
public protocol RawStorable: Storable { }

extension RawStorable {
    /// Read the value from the `store`.
    public static func write(value: Self, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    /// Write the value to the `store`.
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Self? {
        return store.value(forKey: key._value) as? Self
    }
}
