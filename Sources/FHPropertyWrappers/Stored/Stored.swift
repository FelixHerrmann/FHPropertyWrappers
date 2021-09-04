import Foundation
import os.log

/// A property wrapper which reads and writes the wrapped value in the **UserDefaults** store.
///
/// The wrapped value must conform to **Storable**.
@propertyWrapper public struct Stored<Value: Storable>  {
    
    /// The default value if a value of the given type is not specified for the given key.
    public let defaultValue: Value
    
    /// The key to read and write the value to in the **UserDefaults** store.
    public let key: StoreKey
    
    /// The **UserDefaults** store to read and write to.
    public let store: UserDefaults
    
    /// Creates a property wrapper which reads and writes the wrapped value in the **UserDefaults** store.
    /// - Parameters:
    ///   - defaultValue: The default value if a value of the given type is not specified for the given key.
    ///   - key: The key to read and write the value to in the **UserDefaults** store.
    ///   - store: The **UserDefaults** store to read and write to. Default value is `UserDefaults.standard`.
    public init(wrappedValue defaultValue: Value = .defaultStoredValue, _ key: StoreKey, store: UserDefaults = .standard) {
        self.defaultValue = defaultValue
        self.key = key
        self.store = store
    }
    
    public var wrappedValue: Value {
        get {
            do {
                return try Value.read(in: store, key: key) ?? defaultValue
            } catch {
                _logError(error)
                return defaultValue
            }
        }
        set {
            do {
                try newValue.write(in: store, key: key)
            } catch {
                _logError(error)
            }
        }
    }
    
    public var projectedValue: Stored {
        return self
    }
    
    /// Remove the stored value from **UserDefaults**.
    ///
    /// To access this method you have to access the property wrapper via the projected value.
    /// ```swift
    /// @Stored("test") var test = ""
    /// $test.remove()
    /// ```
    public func remove() {
        store.removeObject(forKey: key._value)
    }
}


// MARK: - Log

extension Stored {
    
    private func _logError(_ error: Error) {
        if #available(OSX 10.12, iOS 10.0, tvOS 10.0, *) {
            os_log("Error: %@", log: OSLog(subsystem: "com.felixherrmann.FHPropertyWrappers", category: "Stored"), type: .error, String(describing: error))
        } else {
            NSLog("Error: %@", String(describing: error))
        }
    }
}
