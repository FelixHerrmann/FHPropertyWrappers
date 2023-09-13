// swiftlint:disable line_length

import Foundation
import Security

/// The accessibility level of a keychain item.
public struct SecureStoreAccessibility {
    internal var _value: CFString
}

extension SecureStoreAccessibility {
    /// Can be accessed only while the device is unlocked by the user.
    ///
    /// This is recommended for items that need to be accessible only while the application is in the foreground.
    /// Items with this attribute migrate to a new device when using encrypted backups.
    ///
    /// This is the default value for keychain items added without explicitly setting an accessibility constant.
    public static let whenUnlocked = SecureStoreAccessibility(_value: kSecAttrAccessibleWhenUnlocked)
    
    /// Cannot be accessed after a restart until the device has been unlocked once by the user.
    ///
    /// After the first unlock, the data remains accessible until the next restart.
    /// This is recommended for items that need to be accessed by background applications.
    /// Items with this attribute migrate to a new device when using encrypted backups.
    public static let afterFirstUnlock = SecureStoreAccessibility(_value: kSecAttrAccessibleAfterFirstUnlock)
    
    /// Can always be accessed regardless of whether the device is locked.
    ///
    /// This is not recommended for application use.
    /// Items with this attribute migrate to a new device when using encrypted backups.
    @available(iOS, introduced: 4.0, deprecated: 12.0, message: "Use an accessibility level that provides some user protection, such as kSecAttrAccessibleAfterFirstUnlock")
    @available(macCatalyst, introduced: 13.0, deprecated: 13.0, message: "Use an accessibility level that provides some user protection, such as kSecAttrAccessibleAfterFirstUnlock")
    @available(macOS, introduced: 10.9, deprecated: 10.14, message: "Use an accessibility level that provides some user protection, such as kSecAttrAccessibleAfterFirstUnlock")
    public static let always = SecureStoreAccessibility(_value: kSecAttrAccessibleAlways)
    
    /// Can only be accessed when the device is unlocked. Only available if a passcode is set on the device.
    ///
    /// This is recommended for items that only need to be accessible while the application is in the foreground.
    /// Items with this attribute never migrate to a new device.
    /// After a backup is restored to a new device, these items are missing.
    /// No items can be stored in this class on devices without a passcode.
    /// Disabling the device passcode causes all items in this class to be deleted.
    public static let whenPasscodeSetThisDeviceOnly = SecureStoreAccessibility(_value: kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly)
    
    /// Can be accessed only while the device is unlocked by the user.
    ///
    /// This is recommended for items that need to be accessible only while the application is in the foreground.
    /// Items with this attribute do not migrate to a new device.
    /// Thus, after restoring from a backup of a different device, these items will not be present.
    public static let whenUnlockedThisDeviceOnly = SecureStoreAccessibility(_value: kSecAttrAccessibleWhenUnlockedThisDeviceOnly)
    
    /// Cannot be accessed after a restart until the device has been unlocked once by the user.
    ///
    /// After the first unlock, the data remains accessible until the next restart.
    /// This is recommended for items that need to be accessed by background applications.
    /// Items with this attribute do not migrate to a new device.
    /// Thus, after restoring from a backup of a different device, these items will not be present.
    public static let afterFirstUnlockThisDeviceOnly = SecureStoreAccessibility(_value: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly)
    
    /// Can always be accessed regardless of whether the device is locked.
    ///
    /// This is not recommended for application use.
    /// Items with this attribute do not migrate to a new device.
    /// Thus, after restoring from a backup of a different device, these items will not be present.
    @available(iOS, introduced: 4.0, deprecated: 12.0, message: "Use an accessibility level that provides some user protection, such as kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly")
    @available(macCatalyst, introduced: 13.0, deprecated: 13.0, message: "Use an accessibility level that provides some user protection, such as kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly")
    @available(macOS, introduced: 10.9, deprecated: 10.14, message: "Use an accessibility level that provides some user protection, such as kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly")
    public static let alwaysThisDeviceOnly = SecureStoreAccessibility(_value: kSecAttrAccessibleAlwaysThisDeviceOnly)
}

// swiftlint:enable line_length
