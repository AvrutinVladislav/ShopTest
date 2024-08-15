//
//  GoodsModel.swift
//  Magazine
//
//  Created by Vladislav Avrutin on 14.08.2024.
//

import Foundation

struct Products: Codable, Hashable {
    var products: [Product]
}

struct Product: Codable, Hashable, Identifiable {
    var id = UUID()
    var sale, newProduct, isFavorite, addedInList, blowToPrice: Bool
    let countryOfOrigin, image, title: String
    var rate: Double
    var rateAmount, price, priceCent: Int
    let oldPrice: Double
    let saleAmount: Int
}
