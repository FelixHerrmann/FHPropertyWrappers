import Foundation

/// All types that conform to this protocol can be directly stored in the **UserDefaults**.
public protocol RawStorable: Storable { }

extension RawStorable {
    
    public static func write(value: Self, in store: UserDefaults, key: StoreKey) throws {
        store.set(value, forKey: key._value)
    }
    
    public static func read(in store: UserDefaults, key: StoreKey) throws -> Self? {
        return store.value(forKey: key._value) as? Self
    }
}
