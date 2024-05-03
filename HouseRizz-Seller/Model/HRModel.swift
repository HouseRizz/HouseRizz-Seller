//
//  HRModel.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 03/05/24.
//

import Foundation
import CloudKit

struct CKItemModelName {
    static let name = "name"
    static let description = "description"
    static let price = "price"
    static let imageURL = "imageURL"
    static let modelURL = "modelURL"
    static let itemRecord = "Items"
}

struct HRModel: Hashable, CKitableProtocol {
    let name: String
    let description: String?
    let price: Int?
    let imageURL: URL?
    //let modelURL: URL?
    let record: CKRecord
    
    init?(record: CKRecord){
        guard let name = record[CKItemModelName.name] as? String else {return nil}
        self.name = name
        guard let description = record[CKItemModelName.description] as? String else {return nil}
        self.description = description
        guard let price = record[CKItemModelName.price] as? Int else {return nil}
        self.price = price
        let imageAsset = record[CKItemModelName.imageURL] as? CKAsset
        self.imageURL = imageAsset?.fileURL
//        let modelURL = record[CKItemModelName.modelURL] as? CKAsset
//        self.modelURL = modelURL?.fileURL
        self.record = record
    }
    
    init?(name: String, description: String?, price: Int?, imageURL: URL?) {
        let record = CKRecord(recordType: CKItemModelName.itemRecord)
        record[CKItemModelName.name] = name
        record[CKItemModelName.description] = description
        record[CKItemModelName.price] = price
        if let url = imageURL {
            let asset = CKAsset(fileURL: url)
            record[CKItemModelName.imageURL] = asset
        }
        self.init(record: record)
    }
    
    func update(newName: String) -> HRModel? {
        let record = record
        record[CKItemModelName.name] = newName
        return HRModel(record: record)
    }
}
