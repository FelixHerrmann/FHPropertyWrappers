# FHPropertyWrappers

<p align="left">
<a href="https://github.com/FelixHerrmann/FHPropertyWrappers/releases"><img alt="GitHub version" src="https://img.shields.io/github/v/release/FelixHerrmann/FHPropertyWrappers"></a>
<a href="https://github.com/FelixHerrmann/FHPropertyWrappers/blob/master/LICENSE"><img alt="GitHub license" src="https://img.shields.io/github/license/FelixHerrmann/FHPropertyWrappers"></a>
<a href="https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2FFelixHerrmann%2FFHPropertyWrappers"><img alt="Twitter" src="https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2FFelixHerrmann%2FFHPropertyWrappers"></a>
</p>

Some usefull Swift Property Wrappers.

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


## [UserDefault](https://github.com/FelixHerrmann/FHPropertyWrappers/tree/master/Sources/UserDefault)

A property wrapper which reads and writes the wrapped value in the `UserDefaults` store.

It supports all the types that are allowed by `UserDefaults`. 

```swift
@UserDefault("string") var string = ""
@UserDefault("int") var int: Int
@UserDefault("array") var array: [String]
@UserDefault("dictionary") var dictionary [String: Int]
```

> The default value is based on the `defaultStoredValue` if nothing is setted.

In addition to that, `Optional`, `RawRepresentable` and `Codable` are supported too.
For non-`RawRepresentable` enums use `Codable`. 

```swift
@UserDefault("optional") var optional: String?


enum Enumeration: String, UserDefaultStorable {
    case firstCase
    case secondCase
    
    static var defaultStoredValue: Enumeration {
        return .firstCase
    }
}

@UserDefault("enumeration") var enumeration: Enumeration


struct CustomType: Codable, UserDefaultStorable {
    let name: String
    
    static var defaultStoredValue: CustomType {
        return CustomType(name: "")
    }
}

@UserDefault("codable") var codable: CustomType
```

> The wrapped value must conform to `UserDefaultStorable`.


## License

FHPropertyWrappers is available under the MIT license. See the [LICENSE](https://github.com/FelixHerrmann/FHPropertyWrappers/blob/master/LICENSE) file for more info.
