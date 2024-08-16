//
//  GoodsListCell.swift
//  Magazine
//
//  Created by Vladislav Avrutin on 14.08.2024.
//

import SwiftUI

struct ProductListCell: View {
    
    @Binding var model: Product
    @Binding var cardList: [Product]
    
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
                    if model.countryOfOrigin != "" && !model.isAddedToCard {
                        Text(model.countryOfOrigin)
                            .font(.system(size: 12))
                            .foregroundStyle(.twoSix).opacity(0.6)
                    }
                }
                VStack {
                    Image(.orderlist)
                        .onTapGesture {
                            
                        }
                        if model.isFavorite {
                            Image(.isFavorite)
                                .onTapGesture {
                                    model.isFavorite.toggle()
                                }
                        } else {
                            Image(.isNotFavorite)
                                .onTapGesture {
                                    model.isFavorite.toggle()
                                }
                        }
                }
                .background {
                    Color.white.opacity(0.8)
                }
            }
            Spacer()
            if !model.isAddedToCard {
                priceAndAddedToCard()
            }
            else {
                QuantityOfAddedProduct(model: $model)
                    .padding(.top, 10)
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
                Image(.addToCard)
                    .onTapGesture {
                        model.isAddedToCard.toggle()
                    }
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
    
}
