# FHPropertyWrappers

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FFelixHerrmann%2FFHPropertyWrappers%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/FelixHerrmann/FHPropertyWrappers)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FFelixHerrmann%2FFHPropertyWrappers%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/FelixHerrmann/FHPropertyWrappers)
[![Version](https://img.shields.io/github/v/release/FelixHerrmann/FHPropertyWrappers)](https://github.com/FelixHerrmann/FHPropertyWrappers/releases)
[![License](https://img.shields.io/github/license/FelixHerrmann/FHPropertyWrappers)](https://github.com/FelixHerrmann/FHPropertyWrappers/blob/master/LICENSE)
[![Tweet](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2FFelixHerrmann%2FFHPropertyWrappers)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2FFelixHerrmann%2FFHPropertyWrappers)

Some useful Swift Property Wrappers.

>Will be expanded over time.


## Requirements
- macOS 10.10+
- iOS 9.0+
- tvOS 9.0+


## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

Add the following to the dependencies of your `Package.swift`:

```swift
.package(url: "https://github.com/FelixHerrmann/FHPropertyWrappers.git", from: "x.x.x")
```

### Manual

Download the files in the [Sources](https://github.com/FelixHerrmann/FHPropertyWrappers/tree/master/Sources) folder and drag them into you project.


## [Stored](https://github.com/FelixHerrmann/FHPropertyWrappers/tree/master/Sources/FHPropertyWrappers/Stored)

A property wrapper which reads and writes the wrapped value in the `UserDefaults` store.

It supports all the types that are allowed by `UserDefaults`.
Check all the supported types [here](https://github.com/FelixHerrmann/FHPropertyWrappers/blob/master/Sources/FHPropertyWrappers/Stored/Storable%2BSupportedTypes.swift).

```swift
@Stored("string") var string = ""
@Stored("int") var int: Int
@Stored("array") var array: [String]
@Stored("dictionary") var dictionary [String: Int]
```

> The default value is based on the `defaultStoredValue` if nothing is set.

In addition to that, `Optional`, `RawRepresentable` and `Codable` are supported too.
For non-`RawRepresentable` enums use `Codable`. 

```swift
@Stored("optional") var optional: String?
```

```swift
enum Enumeration: String, Storable {
    case firstCase
    case secondCase
    
    static var defaultStoredValue: Enumeration {
        return .firstCase
    }
}

@Stored("enumeration") var enumeration: Enumeration
```

```swift
struct CustomType: Codable, Storable {
    let name: String
    
    static var defaultStoredValue: CustomType {
        return CustomType(name: "")
    }
}

@Stored("codable") var codable: CustomType
```

> The wrapped value must conform to `Storable`.

> Tip: To store an array of `Storable` (which is not supported, only `RawStorable` types are allowed), create a container struct arround the array which conforms to `Codable`.


## [SecureStored](https://github.com/FelixHerrmann/FHPropertyWrappers/tree/master/Sources/FHPropertyWrappers/SecureStored)

A property wrapper which reads and writes the wrapped value in the `Keychain`.

It supports all the base types, most of them rely on `Codable`.
Check all the supported types [here](https://github.com/FelixHerrmann/FHPropertyWrappers/tree/master/Sources/FHPropertyWrappers/SecureStored/SecureStorable+SupportedTypes.swift).

```swift
@SecureStored("string") var string = ""
@SecureStored("int") var int: Int
@SecureStored("array") var array: [String]
@SecureStored("dictionary") var dictionary [String: Int]
```

> The default value is based on the `defaultStoredValue` if nothing is set.

In addition to that, `Optional`, `RawRepresentable` and `Codable` are supported too.
For non-`RawRepresentable` enums use `Codable`. 

```swift
@SecureStored("optional") var optional: String?
```

```swift
enum Enumeration: String, SecureStorable {
    case firstCase
    case secondCase
    
    static var defaultStoredValue: Enumeration {
        return .firstCase
    }
}

@SecureStored("enumeration") var enumeration: Enumeration
```

```swift
struct CustomType: Codable, SecureStorable {
    let name: String
    
    static var defaultStoredValue: CustomType {
        return CustomType(name: "")
    }
}

@SecureStored("codable") var codable: CustomType
```

> The wrapped value must conform to `SecureStorable`.


## License

FHPropertyWrappers is available under the MIT license. See the [LICENSE](https://github.com/FelixHerrmann/FHPropertyWrappers/blob/master/LICENSE) file for more info.
