import XCTest
@testable import FHPropertyWrappers

struct CustomType: Codable, Equatable {
    var string: String
    var int: Int
}

extension CustomType: Storable {
    
    static var defaultStoredValue: CustomType {
        CustomType(string: "", int: 0)
    }
}

enum RawRepresentableEnumeration: String {
    case a
    case b
}

extension RawRepresentableEnumeration: Storable {
    
    static var defaultStoredValue: RawRepresentableEnumeration {
        return .a
    }
}

extension StoreKey {
    static let bool: StoreKey = "com.felixherrmann.FHPropertyWrappers.bool"
    static let int: StoreKey = "com.felixherrmann.FHPropertyWrappers.int"
    static let int8: StoreKey = "com.felixherrmann.FHPropertyWrappers.int8"
    static let int16: StoreKey = "com.felixherrmann.FHPropertyWrappers.int16"
    static let int32: StoreKey = "com.felixherrmann.FHPropertyWrappers.int32"
    static let int64: StoreKey = "com.felixherrmann.FHPropertyWrappers.int64"
    static let uInt: StoreKey = "com.felixherrmann.FHPropertyWrappers.uInt"
    static let uInt8: StoreKey = "com.felixherrmann.FHPropertyWrappers.uInt8"
    static let uInt16: StoreKey = "com.felixherrmann.FHPropertyWrappers.uInt16"
    static let uInt32: StoreKey = "com.felixherrmann.FHPropertyWrappers.uInt32"
    static let uInt64: StoreKey = "com.felixherrmann.FHPropertyWrappers.uInt64"
    static let float: StoreKey = "com.felixherrmann.FHPropertyWrappers.float"
    static let double: StoreKey = "com.felixherrmann.FHPropertyWrappers.double"
    static let string: StoreKey = "com.felixherrmann.FHPropertyWrappers.string"
    static let date: StoreKey = "com.felixherrmann.FHPropertyWrappers.date"
    static let url: StoreKey = "com.felixherrmann.FHPropertyWrappers.url"
    static let data: StoreKey = "com.felixherrmann.FHPropertyWrappers.data"
    static let array: StoreKey = "com.felixherrmann.FHPropertyWrappers.array"
    static let dictionary: StoreKey = "com.felixherrmann.FHPropertyWrappers.dictionary"
    static let optional: StoreKey = "com.felixherrmann.FHPropertyWrappers.optional"
    static let codable: StoreKey = "com.felixherrmann.FHPropertyWrappers.codable"
    static let rawRepresentable: StoreKey = "com.felixherrmann.FHPropertyWrappers.rawRepresentable"
}

final class StoredTests: XCTestCase {
    
    @Stored(.bool) var bool: Bool
    @Stored(.int) var int: Int
    @Stored(.int8) var int8: Int8
    @Stored(.int16) var int16: Int16
    @Stored(.int32) var int32: Int32
    @Stored(.int64) var int64: Int64
    @Stored(.uInt) var uInt: UInt
    @Stored(.uInt8) var uInt8: UInt8
    @Stored(.uInt16) var uInt16: UInt16
    @Stored(.uInt32) var uInt32: UInt32
    @Stored(.uInt64) var uInt64: UInt64
    @Stored(.float) var float: Float
    @Stored(.double) var double: Double
    @Stored(.string) var string: String
    @Stored(.date) var date: Date = Date(timeIntervalSince1970: 919753200)
    @Stored(.url) var url: URL
    @Stored(.data) var data: Data
    @Stored(.array) var array: [String]
    @Stored(.dictionary) var dictionary: [String: Int]
    @Stored(.optional) var optional: String?
    @Stored(.codable) var codable: CustomType
    @Stored(.rawRepresentable) var rawRepresentable: RawRepresentableEnumeration
    
    func testBool() throws {
        $bool.remove()
        XCTAssertEqual(bool, false)
        XCTAssertNil(UserDefaults.standard.value(forKey: $bool.key._value))
        
        bool = true
        XCTAssertEqual(bool, true)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $bool.key._value) as? Bool, true)
        
        $bool.remove()
        XCTAssertEqual(bool, false)
        XCTAssertNil(UserDefaults.standard.value(forKey: $bool.key._value))
    }
    
    func testInt() throws {
        $int.remove()
        XCTAssertEqual(int, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int.key._value))
        
        int = 1
        XCTAssertEqual(int, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int.key._value) as? Int, 1)
        
        $int.remove()
        XCTAssertEqual(int, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int.key._value))
    }
    
    func testInt8() throws {
        $int8.remove()
        XCTAssertEqual(int8, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int8.key._value))
        
        int8 = 1
        XCTAssertEqual(int8, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int8.key._value) as? Int8, 1)
        
        $int8.remove()
        XCTAssertEqual(int8, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int8.key._value))
    }
    
    func testInt16() throws {
        $int16.remove()
        XCTAssertEqual(int16, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int16.key._value))
        
        int16 = 1
        XCTAssertEqual(int16, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int16.key._value) as? Int16, 1)
        
        $int16.remove()
        XCTAssertEqual(int16, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int16.key._value))
    }
    
    func testInt32() throws {
        $int32.remove()
        XCTAssertEqual(int32, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int32.key._value))
        
        int32 = 1
        XCTAssertEqual(int32, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int32.key._value) as? Int32, 1)
        
        $int32.remove()
        XCTAssertEqual(int32, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int32.key._value))
    }
    
    func testInt64() throws {
        $int64.remove()
        XCTAssertEqual(int64, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int64.key._value))
        
        int64 = 1
        XCTAssertEqual(int64, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int64.key._value) as? Int64, 1)
        
        $int64.remove()
        XCTAssertEqual(int64, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int64.key._value))
    }
    
    func testUInt() throws {
        $uInt.remove()
        XCTAssertEqual(uInt, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt.key._value))
        
        uInt = 1
        XCTAssertEqual(uInt, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt.key._value) as? UInt, 1)
        
        $uInt.remove()
        XCTAssertEqual(uInt, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt.key._value))
    }
    
    func testUInt8() throws {
        $uInt8.remove()
        XCTAssertEqual(uInt8, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt.key._value))
        
        uInt8 = 1
        XCTAssertEqual(uInt8, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt8.key._value) as? UInt8, 1)
        
        $uInt8.remove()
        XCTAssertEqual(uInt8, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt8.key._value))
    }
    
    func testUInt16() throws {
        $uInt16.remove()
        XCTAssertEqual(uInt16, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt16.key._value))
        
        uInt16 = 1
        XCTAssertEqual(uInt16, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt16.key._value) as? UInt16, 1)
        
        $uInt16.remove()
        XCTAssertEqual(uInt16, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt16.key._value))
    }
    
    func testUInt32() throws {
        $uInt32.remove()
        XCTAssertEqual(uInt32, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt32.key._value))
        
        uInt32 = 1
        XCTAssertEqual(uInt32, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt32.key._value) as? UInt32, 1)
        
        $uInt32.remove()
        XCTAssertEqual(uInt32, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt32.key._value))
    }
    
    func testUInt64() throws {
        $uInt64.remove()
        XCTAssertEqual(uInt64, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt64.key._value))
        
        uInt64 = 1
        XCTAssertEqual(uInt64, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt64.key._value) as? UInt64, 1)
        
        $uInt64.remove()
        XCTAssertEqual(uInt64, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt64.key._value))
    }
    
    func testFloat() throws {
        $float.remove()
        XCTAssertEqual(float, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $float.key._value))
        
        float = 0.1
        XCTAssertEqual(float, 0.1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $float.key._value) as? Float, 0.1)
        
        $float.remove()
        XCTAssertEqual(float, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $float.key._value))
    }
    
    func testDouble() throws {
        $double.remove()
        XCTAssertEqual(double, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $double.key._value))
        
        double = 0.1
        XCTAssertEqual(double, 0.1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $double.key._value) as? Double, 0.1)
        
        $double.remove()
        XCTAssertEqual(double, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $double.key._value))
    }
    
    func testString() throws {
        $string.remove()
        XCTAssertEqual(string, "")
        XCTAssertNil(UserDefaults.standard.value(forKey: $string.key._value))
        
        string = "string"
        XCTAssertEqual(string, "string")
        XCTAssertEqual(UserDefaults.standard.value(forKey: $string.key._value) as? String, "string")
        
        $string.remove()
        XCTAssertEqual(string, "")
        XCTAssertNil(UserDefaults.standard.value(forKey: $string.key._value))
    }
    
    func testDate() throws {
        $date.remove()
        XCTAssertEqual(date, Date(timeIntervalSince1970: 919753200))
        XCTAssertNil(UserDefaults.standard.value(forKey: $date.key._value))
        
        date = Date(timeIntervalSince1970: 919753201)
        XCTAssertEqual(date, Date(timeIntervalSince1970: 919753201))
        XCTAssertEqual(UserDefaults.standard.value(forKey: $date.key._value) as? Date, Date(timeIntervalSince1970: 919753201))
        
        $date.remove()
        XCTAssertEqual(date, Date(timeIntervalSince1970: 919753200))
        XCTAssertNil(UserDefaults.standard.value(forKey: $date.key._value))
    }
    
    func testURL() throws {
        $url.remove()
        XCTAssertEqual(url, URL(fileURLWithPath: ""))
        XCTAssertNil(UserDefaults.standard.value(forKey: $url.key._value))
        
        url = URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!
        XCTAssertEqual(url, URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!)
        XCTAssertEqual(UserDefaults.standard.url(forKey: $url.key._value), URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!)
        
        $url.remove()
        XCTAssertEqual(url, URL(fileURLWithPath: ""))
        XCTAssertNil(UserDefaults.standard.value(forKey: $url.key._value))
    }

    func testData() throws {
        $data.remove()
        XCTAssertEqual(data, Data())
        XCTAssertNil(UserDefaults.standard.value(forKey: $data.key._value))

        data = Data("data".utf8)
        XCTAssertEqual(data, Data("data".utf8))
        XCTAssertEqual(UserDefaults.standard.value(forKey: $data.key._value) as? Data, Data("data".utf8))

        $data.remove()
        XCTAssertEqual(data, Data())
        XCTAssertNil(UserDefaults.standard.value(forKey: $data.key._value))
    }
    
    func testArray() throws {
        $array.remove()
        XCTAssertEqual(array, [])
        XCTAssertNil(UserDefaults.standard.value(forKey: $array.key._value))
        
        array = ["a", "b", "c"]
        XCTAssertEqual(array, ["a", "b", "c"])
        XCTAssertEqual(UserDefaults.standard.value(forKey: $array.key._value) as? Array, ["a", "b", "c"])
        
        $array.remove()
        XCTAssertEqual(array, [])
        XCTAssertNil(UserDefaults.standard.value(forKey: $array.key._value))
    }
    
    func testDictionary() throws {
        $dictionary.remove()
        XCTAssertEqual(dictionary, [:])
        XCTAssertNil(UserDefaults.standard.value(forKey: $dictionary.key._value))
        
        dictionary = ["a": 1, "b": 2, "c": 3]
        XCTAssertEqual(dictionary, ["a": 1, "b": 2, "c": 3])
        XCTAssertEqual(UserDefaults.standard.value(forKey: $dictionary.key._value) as? Dictionary, ["a": 1, "b": 2, "c": 3])
        
        $dictionary.remove()
        XCTAssertEqual(dictionary, [:])
        XCTAssertNil(UserDefaults.standard.value(forKey: $dictionary.key._value))
    }
    
    func testOptional() throws {
        $optional.remove()
        XCTAssertNil(optional)
        XCTAssertNil(UserDefaults.standard.value(forKey: $optional.key._value))
        
        optional = "test"
        XCTAssertEqual(optional, Optional<String>("test"))
        XCTAssertEqual(UserDefaults.standard.value(forKey: $optional.key._value) as? String, "test")
        
        optional = nil
        XCTAssertNil(optional)
        XCTAssertNil(UserDefaults.standard.value(forKey: $optional.key._value))
    }
    
    func testCodable() throws {
        $codable.remove()
        XCTAssertEqual(codable, CustomType(string: "", int: 0))
        XCTAssertNil(UserDefaults.standard.value(forKey: $codable.key._value))
        
        codable = CustomType(string: "a", int: 1)
        XCTAssertEqual(codable, CustomType(string: "a", int: 1))
        let testCodableData = try XCTUnwrap(UserDefaults.standard.value(forKey: $codable.key._value) as? Data)
        let decodedTestCodableData = try PropertyListDecoder().decode(CustomType.self, from: testCodableData)
        XCTAssertEqual(decodedTestCodableData, CustomType(string: "a", int: 1))
        
        $codable.remove()
        XCTAssertEqual(codable, CustomType(string: "", int: 0))
        XCTAssertNil(UserDefaults.standard.value(forKey: $codable.key._value))
    }
    
    func testRawRepresentable() throws {
        $rawRepresentable.remove()
        XCTAssertEqual(rawRepresentable, .a)
        XCTAssertNil(UserDefaults.standard.value(forKey: $rawRepresentable.key._value))
        
        rawRepresentable = .b
        XCTAssertEqual(rawRepresentable, .b)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $rawRepresentable.key._value) as? String, "b")
        
        $rawRepresentable.remove()
        XCTAssertEqual(rawRepresentable, .a)
        XCTAssertNil(UserDefaults.standard.value(forKey: $rawRepresentable.key._value))
    }
}
