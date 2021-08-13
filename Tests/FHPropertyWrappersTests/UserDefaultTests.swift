import XCTest
@testable import FHPropertyWrappers

struct CustomType: Codable, UserDefaultStorable, Equatable {
    var string: String
    var int: Int
}

enum RawRepresentableEnumeration: String, UserDefaultStorable {
    case a
    case b
}

extension UserDefaultKey {
    static let bool: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.bool"
    static let nsNumber: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.nsNumber"
    static let int: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.int"
    static let int8: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.int8"
    static let int16: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.int16"
    static let int32: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.int32"
    static let int64: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.int64"
    static let uInt: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.uInt"
    static let uInt8: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.uInt8"
    static let uInt16: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.uInt16"
    static let uInt32: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.uInt32"
    static let uInt64: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.uInt64"
    static let float: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.float"
    static let double: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.double"
    static let nsString: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.nsString"
    static let string: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.string"
    static let nsDate: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.nsDate"
    static let date: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.date"
    static let nsURL: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.nsURL"
    static let url: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.url"
    static let nsData: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.nsData"
    static let data: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.data"
    static let array: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.array"
    static let dictionary: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.dictionary"
    static let optional: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.optional"
    static let codable: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.codable"
    static let rawRepresentable: UserDefaultKey = "com.felixherrmann.FHPropertyWrappers.rawRepresentable"
}

final class UserDefaultTests: XCTestCase {
    
    @UserDefault(.bool) var bool: Bool = false
    @UserDefault(.nsNumber) var nsNumber: NSNumber = 0
    @UserDefault(.int) var int: Int = 0
    @UserDefault(.int8) var int8: Int8 = 0
    @UserDefault(.int16) var int16: Int16 = 0
    @UserDefault(.int32) var int32: Int32 = 0
    @UserDefault(.int64) var int64: Int64 = 0
    @UserDefault(.uInt) var uInt: UInt = 0
    @UserDefault(.uInt8) var uInt8: UInt8 = 0
    @UserDefault(.uInt16) var uInt16: UInt16 = 0
    @UserDefault(.uInt32) var uInt32: UInt32 = 0
    @UserDefault(.uInt64) var uInt64: UInt64 = 0
    @UserDefault(.float) var float: Float = 0
    @UserDefault(.double) var double: Double = 0
    @UserDefault(.nsString) var nsString: NSString = ""
    @UserDefault(.string) var string: String = ""
    @UserDefault(.nsDate) var nsDate: NSDate = NSDate(timeIntervalSince1970: 919753200)
    @UserDefault(.date) var date: Date = Date(timeIntervalSince1970: 919753200)
    @UserDefault(.nsURL) var nsURL: NSURL = NSURL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!
    @UserDefault(.url) var url: URL = URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!
    @UserDefault(.nsData) var nsData: NSData = NSData(data: Data("".utf8))
    @UserDefault(.data) var data: Data = Data("".utf8)
    @UserDefault(.array) var array: [String] = ["a", "b"]
    @UserDefault(.dictionary) var dictionary: [String: Int] = ["a": 1, "b": 2]
    @UserDefault(.optional) var optional: String? = nil
    @UserDefault(.codable) var codabel: CustomType = CustomType(string: "", int: 0)
    @UserDefault(.rawRepresentable) var rawRepresentable: RawRepresentableEnumeration = .a
    
    func testBool() throws {
        $bool.removeFromDefaults()
        XCTAssertEqual(bool, false)
        XCTAssertNil(UserDefaults.standard.value(forKey: $bool.key._value))
        
        bool = true
        XCTAssertEqual(bool, true)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $bool.key._value) as? Bool, true)
        
        $bool.removeFromDefaults()
        XCTAssertEqual(bool, false)
        XCTAssertNil(UserDefaults.standard.value(forKey: $bool.key._value))
    }
    
    func testNSNumber() throws {
        $nsNumber.removeFromDefaults()
        XCTAssertEqual(nsNumber, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsNumber.key._value))
        
        nsNumber = 1
        XCTAssertEqual(nsNumber, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $nsNumber.key._value) as? NSNumber, 1)
        
        $nsNumber.removeFromDefaults()
        XCTAssertEqual(nsNumber, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsNumber.key._value))
    }
    
    func testInt() throws {
        $int.removeFromDefaults()
        XCTAssertEqual(int, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int.key._value))
        
        int = 1
        XCTAssertEqual(int, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int.key._value) as? Int, 1)
        
        $int.removeFromDefaults()
        XCTAssertEqual(int, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int.key._value))
    }
    
    func testInt8() throws {
        $int8.removeFromDefaults()
        XCTAssertEqual(int8, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int8.key._value))
        
        int8 = 1
        XCTAssertEqual(int8, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int8.key._value) as? Int8, 1)
        
        $int8.removeFromDefaults()
        XCTAssertEqual(int8, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int8.key._value))
    }
    
    func testInt16() throws {
        $int16.removeFromDefaults()
        XCTAssertEqual(int16, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int16.key._value))
        
        int16 = 1
        XCTAssertEqual(int16, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int16.key._value) as? Int16, 1)
        
        $int16.removeFromDefaults()
        XCTAssertEqual(int16, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int16.key._value))
    }
    
    func testInt32() throws {
        $int32.removeFromDefaults()
        XCTAssertEqual(int32, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int32.key._value))
        
        int32 = 1
        XCTAssertEqual(int32, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int32.key._value) as? Int32, 1)
        
        $int32.removeFromDefaults()
        XCTAssertEqual(int32, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int32.key._value))
    }
    
    func testInt64() throws {
        $int64.removeFromDefaults()
        XCTAssertEqual(int64, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int64.key._value))
        
        int64 = 1
        XCTAssertEqual(int64, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $int64.key._value) as? Int64, 1)
        
        $int64.removeFromDefaults()
        XCTAssertEqual(int64, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $int64.key._value))
    }
    
    func testUInt() throws {
        $uInt.removeFromDefaults()
        XCTAssertEqual(uInt, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt.key._value))
        
        uInt = 1
        XCTAssertEqual(uInt, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt.key._value) as? UInt, 1)
        
        $uInt.removeFromDefaults()
        XCTAssertEqual(uInt, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt.key._value))
    }
    
    func testUInt8() throws {
        $uInt8.removeFromDefaults()
        XCTAssertEqual(uInt8, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt.key._value))
        
        uInt8 = 1
        XCTAssertEqual(uInt8, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt8.key._value) as? UInt8, 1)
        
        $uInt8.removeFromDefaults()
        XCTAssertEqual(uInt8, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt8.key._value))
    }
    
    func testUInt16() throws {
        $uInt16.removeFromDefaults()
        XCTAssertEqual(uInt16, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt16.key._value))
        
        uInt16 = 1
        XCTAssertEqual(uInt16, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt16.key._value) as? UInt16, 1)
        
        $uInt16.removeFromDefaults()
        XCTAssertEqual(uInt16, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt16.key._value))
    }
    
    func testUInt32() throws {
        $uInt32.removeFromDefaults()
        XCTAssertEqual(uInt32, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt32.key._value))
        
        uInt32 = 1
        XCTAssertEqual(uInt32, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt32.key._value) as? UInt32, 1)
        
        $uInt32.removeFromDefaults()
        XCTAssertEqual(uInt32, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt32.key._value))
    }
    
    func testUInt64() throws {
        $uInt64.removeFromDefaults()
        XCTAssertEqual(uInt64, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt64.key._value))
        
        uInt64 = 1
        XCTAssertEqual(uInt64, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $uInt64.key._value) as? UInt64, 1)
        
        $uInt64.removeFromDefaults()
        XCTAssertEqual(uInt64, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $uInt64.key._value))
    }
    
    func testFloat() throws {
        $float.removeFromDefaults()
        XCTAssertEqual(float, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $float.key._value))
        
        float = 0.1
        XCTAssertEqual(float, 0.1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $float.key._value) as? Float, 0.1)
        
        $float.removeFromDefaults()
        XCTAssertEqual(float, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $float.key._value))
    }
    
    func testDouble() throws {
        $double.removeFromDefaults()
        XCTAssertEqual(double, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $double.key._value))
        
        double = 0.1
        XCTAssertEqual(double, 0.1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $double.key._value) as? Double, 0.1)
        
        $double.removeFromDefaults()
        XCTAssertEqual(double, 0)
        XCTAssertNil(UserDefaults.standard.value(forKey: $double.key._value))
    }
    
    func testNSString() throws {
        $nsString.removeFromDefaults()
        XCTAssertEqual(nsString, "")
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsString.key._value))
        
        nsString = "nsString"
        XCTAssertEqual(nsString, "nsString")
        XCTAssertEqual(UserDefaults.standard.value(forKey: $nsString.key._value) as? NSString, "nsString")
        
        $nsString.removeFromDefaults()
        XCTAssertEqual(nsString, "")
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsString.key._value))
    }
    
    func testString() throws {
        $string.removeFromDefaults()
        XCTAssertEqual(string, "")
        XCTAssertNil(UserDefaults.standard.value(forKey: $string.key._value))
        
        string = "string"
        XCTAssertEqual(string, "string")
        XCTAssertEqual(UserDefaults.standard.value(forKey: $string.key._value) as? String, "string")
        
        $string.removeFromDefaults()
        XCTAssertEqual(string, "")
        XCTAssertNil(UserDefaults.standard.value(forKey: $string.key._value))
    }
    
    func testNSDate() throws {
        $nsDate.removeFromDefaults()
        XCTAssertEqual(nsDate, NSDate(timeIntervalSince1970: 919753200))
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsDate.key._value))
        
        nsDate = NSDate(timeIntervalSince1970: 919753201)
        XCTAssertEqual(nsDate, NSDate(timeIntervalSince1970: 919753201))
        XCTAssertEqual(UserDefaults.standard.value(forKey: $nsDate.key._value) as? NSDate, NSDate(timeIntervalSince1970: 919753201))
        
        $nsDate.removeFromDefaults()
        XCTAssertEqual(nsDate, NSDate(timeIntervalSince1970: 919753200))
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsDate.key._value))
    }
    
    func testDate() throws {
        $date.removeFromDefaults()
        XCTAssertEqual(date, Date(timeIntervalSince1970: 919753200))
        XCTAssertNil(UserDefaults.standard.value(forKey: $date.key._value))
        
        date = Date(timeIntervalSince1970: 919753201)
        XCTAssertEqual(date, Date(timeIntervalSince1970: 919753201))
        XCTAssertEqual(UserDefaults.standard.value(forKey: $date.key._value) as? Date, Date(timeIntervalSince1970: 919753201))
        
        $date.removeFromDefaults()
        XCTAssertEqual(date, Date(timeIntervalSince1970: 919753200))
        XCTAssertNil(UserDefaults.standard.value(forKey: $date.key._value))
    }
    
    func testNSURL() throws {
        $nsURL.removeFromDefaults()
        XCTAssertEqual(nsURL, NSURL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!)
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsURL.key._value))
        
        nsURL = NSURL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers/settings")!
        XCTAssertEqual(nsURL, NSURL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers/settings")!)
        XCTAssertEqual(UserDefaults.standard.url(forKey: $nsURL.key._value) as NSURL?, NSURL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers/settings")!)
        
        $nsURL.removeFromDefaults()
        XCTAssertEqual(nsURL, NSURL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!)
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsURL.key._value))
    }
    
    func testURL() throws {
        $url.removeFromDefaults()
        XCTAssertEqual(url, URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!)
        XCTAssertNil(UserDefaults.standard.value(forKey: $url.key._value))
        
        url = URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers/settings")!
        XCTAssertEqual(url, URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers/settings")!)
        XCTAssertEqual(UserDefaults.standard.url(forKey: $url.key._value), URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers/settings")!)
        
        $url.removeFromDefaults()
        XCTAssertEqual(url, URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!)
        XCTAssertNil(UserDefaults.standard.value(forKey: $url.key._value))
    }
    
    func testNSData() throws {
        $nsData.removeFromDefaults()
        XCTAssertEqual(nsData, NSData(data: Data("".utf8)))
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsData.key._value))

        nsData = NSData(data: Data("data".utf8))
        XCTAssertEqual(nsData, NSData(data: Data("data".utf8)))
        XCTAssertEqual(UserDefaults.standard.value(forKey: $nsData.key._value) as? NSData, NSData(data: Data("data".utf8)))

        $nsData.removeFromDefaults()
        XCTAssertEqual(nsData, NSData(data: Data("".utf8)))
        XCTAssertNil(UserDefaults.standard.value(forKey: $nsData.key._value))
    }

    func testData() throws {
        $data.removeFromDefaults()
        XCTAssertEqual(data, Data("".utf8))
        XCTAssertNil(UserDefaults.standard.value(forKey: $data.key._value))

        data = Data("data".utf8)
        XCTAssertEqual(data, Data("data".utf8))
        XCTAssertEqual(UserDefaults.standard.value(forKey: $data.key._value) as? Data, Data("data".utf8))

        $data.removeFromDefaults()
        XCTAssertEqual(data, Data("".utf8))
        XCTAssertNil(UserDefaults.standard.value(forKey: $data.key._value))
    }

    
    func testArray() throws {
        $array.removeFromDefaults()
        XCTAssertEqual(array, ["a", "b"])
        XCTAssertNil(UserDefaults.standard.value(forKey: $array.key._value))
        
        array = ["a", "b", "c"]
        XCTAssertEqual(array, ["a", "b", "c"])
        XCTAssertEqual(UserDefaults.standard.value(forKey: $array.key._value) as? Array, ["a", "b", "c"])
        
        $array.removeFromDefaults()
        XCTAssertEqual(array, ["a", "b"])
        XCTAssertNil(UserDefaults.standard.value(forKey: $array.key._value))
    }
    
    func _testDictionary() throws {
        $dictionary.removeFromDefaults()
        XCTAssertEqual(dictionary, ["a": 1, "b": 2])
        XCTAssertNil(UserDefaults.standard.value(forKey: $dictionary.key._value))
        
        dictionary = ["a": 1, "b": 2, "c": 3]
        XCTAssertEqual(dictionary, ["a": 1, "b": 2, "c": 3])
        XCTAssertEqual(UserDefaults.standard.value(forKey: $dictionary.key._value) as? Dictionary, ["a": 1, "b": 2, "c": 3])
        
        $dictionary.removeFromDefaults()
        XCTAssertEqual(dictionary, ["a": 1, "b": 2])
        XCTAssertNil(UserDefaults.standard.value(forKey: $dictionary.key._value))
    }
    
    func testOptional() throws {
        $optional.removeFromDefaults()
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
        $codabel.removeFromDefaults()
        XCTAssertEqual(codabel, CustomType(string: "", int: 0))
        XCTAssertNil(UserDefaults.standard.value(forKey: $codabel.key._value))
        
        codabel = CustomType(string: "a", int: 1)
        XCTAssertEqual(codabel, CustomType(string: "a", int: 1))
        let testCodableData = try XCTUnwrap(UserDefaults.standard.value(forKey: $codabel.key._value) as? Data)
        let decodedTestCodableData = try PropertyListDecoder().decode(CustomType.self, from: testCodableData)
        XCTAssertEqual(decodedTestCodableData, CustomType(string: "a", int: 1))
        
        $codabel.removeFromDefaults()
        XCTAssertEqual(codabel, CustomType(string: "", int: 0))
        XCTAssertNil(UserDefaults.standard.value(forKey: $codabel.key._value))
    }
    
    func testRawRepresentable() throws {
        $rawRepresentable.removeFromDefaults()
        XCTAssertEqual(rawRepresentable, .a)
        XCTAssertNil(UserDefaults.standard.value(forKey: $rawRepresentable.key._value))
        
        rawRepresentable = .b
        XCTAssertEqual(rawRepresentable, .b)
        XCTAssertEqual(UserDefaults.standard.value(forKey: $rawRepresentable.key._value) as? String, "b")
        
        $rawRepresentable.removeFromDefaults()
        XCTAssertEqual(rawRepresentable, .a)
        XCTAssertNil(UserDefaults.standard.value(forKey: $rawRepresentable.key._value))
    }
}
