import Foundation
import Security


// MARK: - _KeychainError

internal struct _KeychainError: Error {
    
    internal let _status: OSStatus
    
    internal init(status: OSStatus) {
        self._status = status
    }
}

extension _KeychainError: CustomDebugStringConvertible {
    
    var debugDescription: String {
        switch _status {
        case errSecNotAvailable:
            return "KeychainError: \(_status) (not available)"
        case errSecReadOnly:
            return "KeychainError: \(_status) (read only)"
        case errSecItemNotFound:
            return "KeychainError: \(_status) (item not found)"
        case errSecDuplicateItem:
            return "KeychainError: \(_status) (duplicate item)"
        case errSecDataTooLarge:
            return "KeychainError: \(_status) (data too large)"
        case errSecDataNotAvailable:
            return "KeychainError: \(_status) (data not available)"
        case errSecDataNotModifiable:
            return "KeychainError: \(_status) (data not modifiable)"
        case errSecMissingEntitlement:
            return "KeychainError: \(_status) (missing entitlement)"
        default:
            return "KeychainError: \(_status)"
        }
    }
}


// MARK: - Keychain Query

internal func _KeychainQuery(key: SecureStoreKey, accessibility: SecureStoreAccessibility) -> [CFString: Any] {
    #if !SWIFT_PACKAGE // kSecUseDataProtectionKeychain doesn't work outside of an application
    if #available(iOS 13.0, macOS 10.15, *) {
        return [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: key.description,
            kSecAttrAccessible: accessibility.rawValue,
            kSecUseDataProtectionKeychain: true
        ]
    }
    #endif
    return [
        kSecClass: kSecClassGenericPassword,
        kSecAttrService: key.description,
        kSecAttrAccessible: accessibility.rawValue
    ]
}


// MARK: - Keychain Actions

internal func _KeychainGet(query: [CFString: Any]) throws -> Data? {
    var query = query
    query[kSecReturnData] = true
    
    var result: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &result)
    
    switch status {
    case errSecSuccess:
        return result as? Data
    case errSecItemNotFound:
        return nil
    default:
        throw _KeychainError(status: status)
    }
}

internal func _KeychainSet(value: Data?, query: [CFString: Any]) throws {
    var query = query
    
    let itemExists = SecItemCopyMatching(query as CFDictionary, nil) == errSecSuccess
    
    query[kSecValueData] = value
    
    if itemExists {
        let status = SecItemUpdate(query as CFDictionary, [kSecValueData: value] as CFDictionary)
        
        if status != errSecSuccess {
            throw _KeychainError(status: status)
        }
    } else {
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            throw _KeychainError(status: status)
        }
    }
}

internal func _KeychainDelete(query: [CFString: Any]) throws {
    let status = SecItemDelete(query as CFDictionary)
    
    if status != errSecSuccess && status != errSecItemNotFound {
        throw _KeychainError(status: status)
    }
}
