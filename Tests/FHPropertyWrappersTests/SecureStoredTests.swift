#if !targetEnvironment(simulator) && !targetEnvironment(macCatalyst)
import XCTest
import Security
@testable import FHPropertyWrappers

final class SecureStoredTests: XCTestCase { // swiftlint:disable:this type_body_length
    @SecureStored(.bool)
    private var bool: Bool
    
    @SecureStored(.int)
    private var int: Int
    
    @SecureStored(.int8)
    private var int8: Int8
    
    @SecureStored(.int16)
    private var int16: Int16
    
    @SecureStored(.int32)
    private var int32: Int32
    
    @SecureStored(.int64)
    private var int64: Int64
    
    @SecureStored(.uInt)
    private var uInt: UInt
    
    @SecureStored(.uInt8)
    private var uInt8: UInt8
    
    @SecureStored(.uInt16)
    private var uInt16: UInt16
    
    @SecureStored(.uInt32)
    private var uInt32: UInt32
    
    @SecureStored(.uInt64)
    private var uInt64: UInt64
    
    @SecureStored(.float)
    private var float: Float
    
    @SecureStored(.double)
    private var double: Double
    
    @SecureStored(.string)
    private var string: String
    
    @SecureStored(.date)
    private var date = Date(timeIntervalSince1970: 919_753_200)
    
    @SecureStored(.url)
    private var url: URL
    
    @SecureStored(.data)
    private var data: Data
    
    @SecureStored(.array)
    private var array: [String]
    
    @SecureStored(.dictionary)
    private var dictionary: [String: Int]
    
    @SecureStored(.optional)
    private var optional: String?
    
    @SecureStored(.codable)
    private var codable: CustomSecureType
    
    @SecureStored(.rawRepresentable)
    private var rawRepresentable: RawRepresentableSecureEnumeration
    
    func testBool() throws {
        $bool.remove()
        XCTAssertFalse(bool)
        XCTAssertTrue(_checkIfItemNotExists(key: $bool.key))
        
        bool = true
        XCTAssertTrue(bool)
        XCTAssertEqual(try _getItem(stored: $bool), .some(true))
        
        $bool.remove()
        XCTAssertFalse(bool)
        XCTAssertTrue(_checkIfItemNotExists(key: $bool.key))
    }
    
    func testInt() throws {
        $int.remove()
        XCTAssertEqual(int, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int.key))
        
        int = 1
        XCTAssertEqual(int, 1)
        XCTAssertEqual(try _getItem(stored: $int), 1)
        
        $int.remove()
        XCTAssertEqual(int, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int.key))
    }
    
    func testInt8() throws {
        $int8.remove()
        XCTAssertEqual(int8, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int8.key))
        
        int8 = 1
        XCTAssertEqual(int8, 1)
        XCTAssertEqual(try _getItem(stored: $int8), 1)
        
        $int8.remove()
        XCTAssertEqual(int8, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int8.key))
    }
    
    func testInt16() throws {
        $int16.remove()
        XCTAssertEqual(int16, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int16.key))
        
        int16 = 1
        XCTAssertEqual(int16, 1)
        XCTAssertEqual(try _getItem(stored: $int16), 1)
        
        $int16.remove()
        XCTAssertEqual(int16, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int16.key))
    }
    
    func testInt32() throws {
        $int32.remove()
        XCTAssertEqual(int32, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int32.key))
        
        int32 = 1
        XCTAssertEqual(int32, 1)
        XCTAssertEqual(try _getItem(stored: $int32), 1)
        
        $int32.remove()
        XCTAssertEqual(int32, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int32.key))
    }
    
    func testInt64() throws {
        $int64.remove()
        XCTAssertEqual(int64, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int64.key))
        
        int64 = 1
        XCTAssertEqual(int64, 1)
        XCTAssertEqual(try _getItem(stored: $int64), 1)
        
        $int64.remove()
        XCTAssertEqual(int64, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $int64.key))
    }
    
    func testUInt() throws {
        $uInt.remove()
        XCTAssertEqual(uInt, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt.key))
        
        uInt = 1
        XCTAssertEqual(uInt, 1)
        XCTAssertEqual(try _getItem(stored: $uInt), 1)
        
        $uInt.remove()
        XCTAssertEqual(uInt, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt.key))
    }
    
    func testUInt8() throws {
        $uInt8.remove()
        XCTAssertEqual(uInt8, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt8.key))
        
        uInt8 = 1
        XCTAssertEqual(uInt8, 1)
        XCTAssertEqual(try _getItem(stored: $uInt8), 1)
        
        $uInt8.remove()
        XCTAssertEqual(uInt8, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt8.key))
    }
    
    func testUInt16() throws {
        $uInt16.remove()
        XCTAssertEqual(uInt16, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt16.key))
        
        uInt16 = 1
        XCTAssertEqual(uInt16, 1)
        XCTAssertEqual(try _getItem(stored: $uInt16), 1)
        
        $uInt16.remove()
        XCTAssertEqual(uInt16, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt16.key))
    }
    
    func testUInt32() throws {
        $uInt32.remove()
        XCTAssertEqual(uInt32, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt32.key))
        
        uInt32 = 1
        XCTAssertEqual(uInt32, 1)
        XCTAssertEqual(try _getItem(stored: $uInt32), 1)
        
        $uInt32.remove()
        XCTAssertEqual(uInt32, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt32.key))
    }
    
    func testUInt64() throws {
        $uInt64.remove()
        XCTAssertEqual(uInt64, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt64.key))
        
        uInt64 = 1
        XCTAssertEqual(uInt64, 1)
        XCTAssertEqual(try _getItem(stored: $uInt64), 1)
        
        $uInt64.remove()
        XCTAssertEqual(uInt64, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $uInt64.key))
    }
    
    func testFloat() throws {
        $float.remove()
        XCTAssertEqual(float, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $float.key))
        
        float = 0.1
        XCTAssertEqual(float, 0.1)
        XCTAssertEqual(try _getItem(stored: $float), 0.1)
        
        $float.remove()
        XCTAssertEqual(float, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $float.key))
    }
    
    func testDouble() throws {
        $double.remove()
        XCTAssertEqual(double, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $double.key))
        
        double = 0.1
        XCTAssertEqual(double, 0.1)
        XCTAssertEqual(try _getItem(stored: $double), 0.1)
        
        $double.remove()
        XCTAssertEqual(double, 0)
        XCTAssertTrue(_checkIfItemNotExists(key: $double.key))
    }
    
    func testString() throws {
        $string.remove()
        XCTAssertEqual(string, "")
        XCTAssertTrue(_checkIfItemNotExists(key: $string.key))
        
        string = "string"
        XCTAssertEqual(string, "string")
        let data = try XCTUnwrap(_getData(key: $string.key))
        XCTAssertEqual(String(bytes: data, encoding: .utf8), "string")
        
        $string.remove()
        XCTAssertEqual(string, "")
        XCTAssertTrue(_checkIfItemNotExists(key: $string.key))
    }
    
    func testDate() throws {
        $date.remove()
        XCTAssertEqual(date, Date(timeIntervalSince1970: 919_753_200))
        XCTAssertTrue(_checkIfItemNotExists(key: $date.key))
        
        date = Date(timeIntervalSince1970: 919_753_201)
        XCTAssertEqual(date, Date(timeIntervalSince1970: 919_753_201))
        XCTAssertEqual(try _getItem(stored: $date), Date(timeIntervalSince1970: 919_753_201))
        
        $date.remove()
        XCTAssertEqual(date, Date(timeIntervalSince1970: 919_753_200))
        XCTAssertTrue(_checkIfItemNotExists(key: $date.key))
    }
    
    func testURL() throws {
        $url.remove()
        XCTAssertEqual(url, URL(fileURLWithPath: ""))
        XCTAssertTrue(_checkIfItemNotExists(key: $url.key))
        
        // swiftlint:disable force_unwrapping
        url = URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!
        XCTAssertEqual(url, URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!)
        XCTAssertEqual(try _getItem(stored: $url), URL(string: "https://github.com/FelixHerrmann/FHPropertyWrappers")!)
        // swiftlint:enable force_unwrapping
        
        $url.remove()
        XCTAssertEqual(url, URL(fileURLWithPath: ""))
        XCTAssertTrue(_checkIfItemNotExists(key: $url.key))
    }
    
    func testData() throws {
        $data.remove()
        XCTAssertEqual(data, Data())
        XCTAssertTrue(_checkIfItemNotExists(key: $data.key))
        
        data = Data("data".utf8)
        XCTAssertEqual(data, Data("data".utf8))
        XCTAssertEqual(_getData(key: $data.key), Data("data".utf8))
        
        $data.remove()
        XCTAssertEqual(data, Data())
        XCTAssertTrue(_checkIfItemNotExists(key: $data.key))
    }
    
    func testArray() throws {
        $array.remove()
        XCTAssertEqual(array, [])
        XCTAssertTrue(_checkIfItemNotExists(key: $array.key))
        
        array = ["a", "b", "c"]
        XCTAssertEqual(array, ["a", "b", "c"])
        XCTAssertEqual(try _getItem(stored: $array), ["a", "b", "c"])
        
        $array.remove()
        XCTAssertEqual(array, [])
        XCTAssertTrue(_checkIfItemNotExists(key: $array.key))
    }
    
    func testDictionary() throws {
        $dictionary.remove()
        XCTAssertEqual(dictionary, [:])
        XCTAssertTrue(_checkIfItemNotExists(key: $dictionary.key))
        
        dictionary = ["a": 1, "b": 2, "c": 3]
        XCTAssertEqual(dictionary, ["a": 1, "b": 2, "c": 3])
        XCTAssertEqual(try _getItem(stored: $dictionary), ["a": 1, "b": 2, "c": 3])
        
        $dictionary.remove()
        XCTAssertEqual(dictionary, [:])
        XCTAssertTrue(_checkIfItemNotExists(key: $dictionary.key))
    }
    
    func testOptional() throws {
        $optional.remove()
        XCTAssertNil(optional)
        XCTAssertTrue(_checkIfItemNotExists(key: $optional.key))
        
        optional = "test"
        XCTAssertEqual(optional, "test")
        let data = _getData(key: $optional.key)
        let string = data.flatMap { String(bytes: $0, encoding: .utf8) }
        XCTAssertEqual(string, "test")
        
        optional = nil
        XCTAssertNil(optional)
        XCTAssertTrue(_checkIfItemNotExists(key: $optional.key))
    }
    
    func testCodable() throws {
        $codable.remove()
        XCTAssertEqual(codable, CustomSecureType(string: "", int: 0))
        XCTAssertTrue(_checkIfItemNotExists(key: $codable.key))
        
        codable = CustomSecureType(string: "a", int: 1)
        XCTAssertEqual(codable, CustomSecureType(string: "a", int: 1))
        let testCodableData = try XCTUnwrap(_getData(key: $codable.key))
        let decodedTestCodableData = try JSONDecoder().decode(CustomSecureType.self, from: testCodableData)
        XCTAssertEqual(decodedTestCodableData, CustomSecureType(string: "a", int: 1))
        
        $codable.remove()
        XCTAssertEqual(codable, CustomSecureType(string: "", int: 0))
        XCTAssertTrue(_checkIfItemNotExists(key: $codable.key))
    }
    
    func testRawRepresentable() throws {
        $rawRepresentable.remove()
        XCTAssertEqual(rawRepresentable, .a)
        XCTAssertTrue(_checkIfItemNotExists(key: $rawRepresentable.key))
        
        rawRepresentable = .b
        XCTAssertEqual(rawRepresentable, .b)
        let data = try XCTUnwrap(_getData(key: $rawRepresentable.key))
        XCTAssertEqual(String(bytes: data, encoding: .utf8), "b")
        
        $rawRepresentable.remove()
        XCTAssertEqual(rawRepresentable, .a)
        XCTAssertTrue(_checkIfItemNotExists(key: $rawRepresentable.key))
    }
}

// MARK: - Helpers

private struct CustomSecureType: Codable, Equatable {
    var string: String
    var int: Int
}

extension CustomSecureType: SecureStorable {
    static var defaultStoredValue: CustomSecureType {
        CustomSecureType(string: "", int: 0)
    }
}

private enum RawRepresentableSecureEnumeration: String {
    case a // swiftlint:disable:this identifier_name
    case b // swiftlint:disable:this identifier_name
}

extension RawRepresentableSecureEnumeration: SecureStorable {
    static var defaultStoredValue: RawRepresentableSecureEnumeration {
        return .a
    }
}

extension SecureStoreKey {
    fileprivate static let bool: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.bool"
    fileprivate static let int: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.int"
    fileprivate static let int8: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.int8"
    fileprivate static let int16: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.int16"
    fileprivate static let int32: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.int32"
    fileprivate static let int64: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.int64"
    fileprivate static let uInt: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.uInt"
    fileprivate static let uInt8: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.uInt8"
    fileprivate static let uInt16: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.uInt16"
    fileprivate static let uInt32: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.uInt32"
    fileprivate static let uInt64: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.uInt64"
    fileprivate static let float: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.float"
    fileprivate static let double: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.double"
    fileprivate static let string: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.string"
    fileprivate static let date: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.date"
    fileprivate static let url: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.url"
    fileprivate static let data: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.data"
    fileprivate static let array: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.array"
    fileprivate static let dictionary: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.dictionary"
    fileprivate static let optional: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.optional"
    fileprivate static let codable: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.codable"
    fileprivate static let rawRepresentable: SecureStoreKey = "com.felixherrmann.FHPropertyWrappers.rawRepresentable"
}

extension SecureStoredTests {
    private func _query(key: SecureStoreKey) -> [CFString: Any] {
        #if !SWIFT_PACKAGE // kSecUseDataProtectionKeychain doesn't work outside of an application
        if #available(iOS 13.0, macOS 10.15, *) {
            return [
                kSecClass: kSecClassGenericPassword,
                kSecAttrService: key.description,
                kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,
                kSecUseDataProtectionKeychain: true
            ]
        }
        #endif
        return [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: key.description,
            kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
        ]
    }
    
    private func _checkIfItemNotExists(key: SecureStoreKey) -> Bool {
        return SecItemCopyMatching(_query(key: key) as CFDictionary, nil) == errSecItemNotFound
    }
    
    private func _getData(key: SecureStoreKey) -> Data? {
        var query = _query(key: key)
        query[kSecReturnData] = true
        var result: CFTypeRef?
        SecItemCopyMatching(query as CFDictionary, &result)
        return result as? Data
    }
    
    private func _getItem<T: Decodable>(stored: SecureStored<T>) throws -> T? {
        guard let data = _getData(key: stored.key) else { return nil }
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
#endif // !targetEnvironment(simulator) && !targetEnvironment(macCatalyst)

// swiftlint:disable:this file_length
