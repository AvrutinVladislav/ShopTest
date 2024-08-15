//
//  GoodsListCell.swift
//  Magazine
//
//  Created by Vladislav Avrutin on 14.08.2024.
//

import SwiftUI

struct ProductListCell: View {
    
    @Binding var isAddedToCard: Bool
    @Binding var isProductWeightInKg: Bool
    @Binding var model: Product
    
    var body: some View {
        VStack {
            HStack {
                imageCard()
                    .padding(.trailing, 8)
                cardInformation()
            }
            .frame(height: 176)
        }
    }
    
    @ViewBuilder private func cardInformation() -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 2) {
                        Image(.star)
                        Text(model.rate.description)
                            .font(.system(size: 12))
                            .foregroundStyle(.black).opacity(0.8)
                        Divider()
                            .frame(width: 1, height: 16)
                            .foregroundStyle(.twoSix).opacity(0.6)
                        Text("\(model.rateAmount) отзывов")
                            .font(.system(size: 12))
                            .foregroundStyle(.twoSix).opacity(0.6)
                    }
                    Text(model.title)
                        .font(.system(size: 12))
                        .foregroundStyle(.twoSix).opacity(0.8)
                    if model.countryOfOrigin != "" && !isAddedToCard {
                        Text(model.countryOfOrigin)
                            .font(.system(size: 12))
                            .foregroundStyle(.twoSix).opacity(0.6)
                    }
                }
                VStack {
                    Button(action: {
                        
                    }, label: {
                        Image(.orderlist)
                    })
                    Button(action: {
                        model.isFavorite.toggle()
                    }, label: {
                        if model.isFavorite {
                            Image(.isFavorite)
                        } else {
                            Image(.isNotFavorite)
                        }
                    })
                }
                .background {
                    Color.white.opacity(0.8)
                }
            }
            Spacer()
            if !isAddedToCard {
                priceAndAddedToCard()
            }
            else {
                quantityOfAddedProduct()
            }

        }
        .frame(height: 144)
    }
    
    @ViewBuilder private func priceAndAddedToCard() -> some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(model.price.description)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.twoSix)
                    Text(model.priceCent.description)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.twoSix)
                        .padding(.init(top: -3, leading: -7, bottom: 0, trailing: 0))
                    Image(.perAmountIcon)
                        .padding(.init(top: 0, leading: -6, bottom: 0, trailing: 0))
                }
                Text(model.oldPrice.description)
                    .strikethrough()
                    .font(.system(size: 16))
                    .foregroundStyle(.twoSix.opacity(0.6))
            }
            Spacer(minLength: 0)
            VStack {
                Button(action: {
                    isAddedToCard.toggle()
                }, label: {
                    Image(.addToCard)
            })
            }
        }
        .padding(.init(top: 4, leading: 4, bottom: 0, trailing: 4))
    }
    
    @ViewBuilder private func imageCard() -> some View {
        VStack {
            HStack {
                if model.blowToPrice {
                    Image(.blowToPrices)
                        .clipShape(CustomCorner(radius: 6, corners: [.bottomRight, .topLeft, .topRight]))
                }
                else if model.newProduct {
                    Image(.newItem)
                        .clipShape(CustomCorner(radius: 6, corners: [.bottomRight, .topLeft, .topRight]))
                }
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                if model.sale {
                    Text("\(model.saleAmount.description)%")
                        .foregroundStyle(.discount)
                        .font(.system(size: 16, weight: .bold))
                }
            }
        }
        .background(Image(model.image))
        .frame(width: 144, height: 144)
    }
    
    @ViewBuilder private func quantityOfAddedProduct() -> some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Spacer()
                    Text("Шт")
                        .padding(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .font(!isProductWeightInKg ? .system(size: 14, weight: .medium) : .system(size: 14))
                        .foregroundStyle(!isProductWeightInKg ? .twoSix : .twoSix.opacity(0.6))
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(!isProductWeightInKg ? .white : .productQuantity)
                .clipShape(CustomCorner(radius: 8))
                Button {
                    
                } label: {
                    Spacer()
                    Text("Кг")
                        .padding(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .font(isProductWeightInKg ? .system(size: 14, weight: .medium) : .system(size: 14))
                        .foregroundStyle(isProductWeightInKg ? .twoSix : .twoSix.opacity(0.6))
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(isProductWeightInKg ? .white : .productQuantity)
                .clipShape(CustomCorner(radius: 8))
            }
            .frame(height: 28)
            .background(Color.productQuantity)
            .clipShape(CustomCorner(radius: 8))
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 14, height: 2)
                        .padding(11)
                }
                Spacer()
                VStack {
                    Text("0.1 кг")
                        .font(.system(size: 16, weight: .bold))
                    Text("~5.92 р")
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.8))
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 14, height: 2)
                        .padding(11)
                }
            }
            .frame(height: 28)
            .padding(2)
            .foregroundStyle(.white)
            .background(Color.green)
            .clipShape(CustomCorner(radius: 40))
        }
    }
}

//struct GoodsListCellPreviews: PreviewProvider {
//    static var previews: some View {
//        ProductListCell(isAddedToCard: .constant(false),
//                      isProductWeightInKg: .constant(true),
//                      model: Product(sale: true, newProduct: false, isFavorite: false, addedInList: false, blowToPrice: true, countryOfOrigin: "Франция 🇫🇷", image: "firstImage", title: "сыр Ламбер 500/0 230г сыр Ламбер 500/0 230г", rate: 4.1, rateAmount: 19, price: 99999, priceCent: 90, oldPrice: 190.89, saleAmount: 25))
//    }
//}
