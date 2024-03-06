//
//  UserDefaults+Wrapper.swift
//  Localization-Catalog-UIKit
//
//  Created by sparkout on 06/03/24.
//

import Foundation

public protocol AnyOptional {
    /// Returns `true` if `nil`, otherwise `false`.
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
}

@propertyWrapper
struct UserDefault<ValueType> {
    let key: String
    let defaultValue: ValueType
    init(key: String, defaultValue: ValueType) {
        self.key = key
        self.defaultValue = defaultValue
    }
    var wrappedValue: ValueType {
        get { (UserDefaults.standard.value(forKey: key) as? ValueType) ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}

extension UserDefaults {
    @UserDefault(key: "APP_LOCALE", defaultValue: "en")
    static var appLocale: String
}
