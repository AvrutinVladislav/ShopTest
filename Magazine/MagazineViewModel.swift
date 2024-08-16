//
//  MagazineViewModel.swift
//  Magazine
//
//  Created by Vladislav Avrutin on 14.08.2024.
//

import Foundation

class MagazineViewModel: ObservableObject {
    
//    func addtoFavorite(_ model: Product) {
//        model.isFavorite.toggle()
//    }
    
    
    var MOKEData: [Product] = [
        Product(sale: false, newProduct: false, isFavorite: true, addedInList: false, blowToPrice: false, isAddedToCard: false, isProductWeightInKg: false, countryOfOrigin: "Франция 🇫🇷", image: "firstImage", title: "Дорадо Охлажденная Непотрошеная 300-400г", rate: 4.1, rateAmount: 19, price: 99, priceCent: 90, oldPrice: 199.0, saleAmount: 0),
        
        Product(sale: true, newProduct: true, isFavorite: false, addedInList: false, blowToPrice: false, isAddedToCard: false, isProductWeightInKg: true, countryOfOrigin: "Франция 🇫🇷", image: "secondImage", title: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", rate: 4.1, rateAmount: 19, price: 120, priceCent: 90, oldPrice: 199.0, saleAmount: 25),
        
        Product(sale: false, newProduct: false, isFavorite: true, addedInList: false, blowToPrice: true, isAddedToCard: false, isProductWeightInKg: true, countryOfOrigin: "", image: "thirdImage", title: "сыр Ламбер 500/0 230г сыр Ламбер 500/0 230г", rate: 4.1, rateAmount: 19, price: 99, priceCent: 90, oldPrice: 199.0, saleAmount: 0),
        
        Product(sale: true, newProduct: false, isFavorite: false, addedInList: false, blowToPrice: true, isAddedToCard: false, isProductWeightInKg: true, countryOfOrigin: "Франция 🇫🇷", image: "fourthImage", title: "Огурцы тепличные cадово-огородные", rate: 4.1, rateAmount: 19, price: 130, priceCent: 00, oldPrice: 190.89, saleAmount: 25),
        
        Product(sale: true, newProduct: false, isFavorite: true, addedInList: false, blowToPrice: true, isAddedToCard: false, isProductWeightInKg: true, countryOfOrigin: "Франция 🇫🇷", image: "fifthImage", title: "Манго Кео", rate: 4.1, rateAmount: 19, price: 86590, priceCent: 90, oldPrice: 190.89, saleAmount: 25),
        
        Product(sale: false, newProduct: false, isFavorite: false, addedInList: false, blowToPrice: true, isAddedToCard: false, isProductWeightInKg: true, countryOfOrigin: "", image: "sixthImage", title: "Масло Слобода Рафинированное 1,8л", rate: 4.1, rateAmount: 19, price: 1298, priceCent: 90, oldPrice: 199.0, saleAmount: 0),
        
        Product(sale: false, newProduct: true, isFavorite: true, addedInList: false, blowToPrice: false, isAddedToCard: false, isProductWeightInKg: true, countryOfOrigin: "", image: "seventhImage", title: "Макаронные Изделия SPAR Спагетти 450г", rate: 4.1, rateAmount: 19, price: 2600, priceCent: 90, oldPrice: 190.89, saleAmount: 0),
        
        Product(sale: false, newProduct: false, isFavorite: false, addedInList: false, blowToPrice: false, isAddedToCard: false, isProductWeightInKg: true, countryOfOrigin: "Франция 🇫🇷", image: "eighthImage", title: "Салат Овощной с Крабовыми Палочками", rate: 4.1, rateAmount: 19, price: 250, priceCent: 00, oldPrice: 190.89, saleAmount: 0),
        
        Product(sale: false, newProduct: false, isFavorite: false, addedInList: false, blowToPrice: false, isAddedToCard: false, isProductWeightInKg: false, countryOfOrigin: "", image: "ninthImage", title: "Огурцы тепличные cадово-огородные", rate: 4.1, rateAmount: 19, price: 133, priceCent: 90, oldPrice: 190.89, saleAmount: 0),
        
        Product(sale: true, newProduct: false, isFavorite: false, addedInList: false, blowToPrice: false, isAddedToCard: false, isProductWeightInKg: true, countryOfOrigin: "", image: "tenthImage", title: "сыр Ламбер 500/0 230г сыр Ламбер 500/0 230г", rate: 4.1, rateAmount: 19, price: 99999, priceCent: 90, oldPrice: 190.89, saleAmount: 0),
        
        Product(sale: false, newProduct: false, isFavorite: false, addedInList: false, blowToPrice: false, isAddedToCard: false, isProductWeightInKg: true, countryOfOrigin: "Франция 🇫🇷", image: "eleventhImage", title: "сыр Ламбер 500/0 230г сыр Ламбер 500/0 230г", rate: 4.1, rateAmount: 19, price: 444, priceCent: 55, oldPrice: 190.89, saleAmount: 0)
    ]
}
