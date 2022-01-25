//
//  K.swift
//  Easy Chat
//
//  Created by Ishaan Sarna on 25/01/22.
//  Copyright © 2022 Ishaan Sarna. All rights reserved.
//

struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "TableViewCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
