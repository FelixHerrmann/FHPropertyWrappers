import Foundation
import os.log

/// A property wrapper which reads and writes the wrapped value in the **Keychain**.
///
/// The wrapped value must conform to **SecureStorable**.
@propertyWrapper public struct SecureStored<Value: SecureStorable>  {
    
    /// The default value if a value of the given type is not specified for the given key.
    public let defaultValue: Value
    
    /// The key to read and write the value to in the **Keychain**.
    public let key: SecureStoreKey
    
    /// The level of accessibility.
    public let accessibility: SecureStoreAccessibility
    
    /// Creates a property wrapper which reads and writes the wrapped value in the **Keychain**.
    /// - Parameters:
    ///   - defaultValue: The default value if a value of the given type is not specified for the given key.
    ///   - key: The key to read and write the value to in the **Keychain**.
    ///   - accessibility: The level of accessibility. Defaults to `SecureStoreAccessibility.afterFirstUnlockThisDeviceOnly`
    public init(wrappedValue defaultValue: Value = .defaultStoredValue, _ key: SecureStoreKey, accessibility: SecureStoreAccessibility = .afterFirstUnlockThisDeviceOnly) {
        self.defaultValue = defaultValue
        self.key = key
        self.accessibility = accessibility
    }
    
    public var wrappedValue: Value {
        get {
            do {
                return try Value.read(key: key, accessibility: accessibility) ?? defaultValue
            } catch {
                _logError(error)
                return defaultValue
            }
        }
        set {
            do {
                try newValue.write(key: key, accessibility: accessibility)
            } catch {
                _logError(error)
            }
        }
    }
    
    public var projectedValue: SecureStored {
        return self
    }
    
    /// Remove the stored value from the **Keychain**.
    ///
    /// To access this method you have to access the property wrapper via the projected value.
    /// ```swift
    /// @SecureStored("test") var test = ""
    /// $test.remove()
    /// ```
    public func remove() {
        let query = _KeychainQuery(key: key, accessibility: accessibility)
        do {
            try _KeychainDelete(query: query)
        } catch {
            _logError(error)
        }
    }
}


// MARK: - Log

extension SecureStored {
    
    private func _logError(_ error: Error) {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, *) {
            os_log("Error: %@", log: OSLog(subsystem: "com.felixherrmann.FHPropertyWrappers", category: "SecureStored"), type: .error, String(describing: error))
        } else {
            NSLog("Error: %@", String(describing: error))
        }
    }
}
