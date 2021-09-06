import Foundation
import Security

/// The accessibility level of a keychain item.
public enum SecureStoreAccessibility {
    
    /// Can be accessed only while the device is unlocked by the user.
    ///
    /// This is recommended for items that need to be accessible only while the application is in the foreground.
    /// Items with this attribute migrate to a new device when using encrypted backups.
    ///
    /// This is the default value for keychain items added without explicitly setting an accessibility constant.
    case whenUnlocked
    
    /// Cannot be accessed after a restart until the device has been unlocked once by the user.
    ///
    /// After the first unlock, the data remains accessible until the next restart.
    /// This is recommended for items that need to be accessed by background applications.
    /// Items with this attribute migrate to a new device when using encrypted backups.
    case afterFirstUnlock
    
    /// Can always be accessed regardless of whether the device is locked.
    ///
    /// This is not recommended for application use.
    /// Items with this attribute migrate to a new device when using encrypted backups.
    @available(iOS, introduced: 4.0, deprecated: 12.0, message: "Use an accessibility level that provides some user protection, such as kSecAttrAccessibleAfterFirstUnlock")
    case always
    
    /// Can only be accessed when the device is unlocked. Only available if a passcode is set on the device.
    ///
    /// This is recommended for items that only need to be accessible while the application is in the foreground.
    /// Items with this attribute never migrate to a new device.
    /// After a backup is restored to a new device, these items are missing.
    /// No items can be stored in this class on devices without a passcode.
    /// Disabling the device passcode causes all items in this class to be deleted.
    case whenPasscodeSetThisDeviceOnly
    
    /// Can be accessed only while the device is unlocked by the user.
    ///
    /// This is recommended for items that need to be accessible only while the application is in the foreground.
    /// Items with this attribute do not migrate to a new device.
    /// Thus, after restoring from a backup of a different device, these items will not be present.
    case whenUnlockedThisDeviceOnly
    
    /// Cannot be accessed after a restart until the device has been unlocked once by the user.
    ///
    /// After the first unlock, the data remains accessible until the next restart.
    /// This is recommended for items that need to be accessed by background applications.
    /// Items with this attribute do not migrate to a new device.
    /// Thus, after restoring from a backup of a different device, these items will not be present.
    case afterFirstUnlockThisDeviceOnly
    
    /// Can always be accessed regardless of whether the device is locked.
    ///
    /// This is not recommended for application use.
    /// Items with this attribute do not migrate to a new device.
    /// Thus, after restoring from a backup of a different device, these items will not be present.
    @available(iOS, introduced: 4.0, deprecated: 12.0, message: "Use an accessibility level that provides some user protection, such as kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly")
    case alwaysThisDeviceOnly
}


// MARK: - SecureStoreAccessibility + RawRepresentable

extension SecureStoreAccessibility: RawRepresentable {
    
    public var rawValue: CFString {
        switch self {
        case .whenUnlocked: return kSecAttrAccessibleWhenUnlocked
        case .afterFirstUnlock: return kSecAttrAccessibleAfterFirstUnlock
        case .always: return kSecAttrAccessibleAlways
        case .whenPasscodeSetThisDeviceOnly: return kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
        case .whenUnlockedThisDeviceOnly: return kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        case .afterFirstUnlockThisDeviceOnly: return kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
        case .alwaysThisDeviceOnly: return kSecAttrAccessibleAlwaysThisDeviceOnly
        }
    }
    
    public init?(rawValue: CFString) {
        switch rawValue {
        case kSecAttrAccessibleWhenUnlocked: self = .whenUnlocked
        case kSecAttrAccessibleAfterFirstUnlock: self = .afterFirstUnlock
        case kSecAttrAccessibleAlways: self = .always
        case kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly: self = .whenPasscodeSetThisDeviceOnly
        case kSecAttrAccessibleWhenUnlockedThisDeviceOnly: self = .whenUnlockedThisDeviceOnly
        case kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly: self = .afterFirstUnlockThisDeviceOnly
        case kSecAttrAccessibleAlwaysThisDeviceOnly: self = .alwaysThisDeviceOnly
        default: return nil
        }
    }
}
