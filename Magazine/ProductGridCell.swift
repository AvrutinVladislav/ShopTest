//
//  GoodsGridCell.swift
//  Magazine
//
//  Created by Vladislav Avrutin on 14.08.2024.
//

import SwiftUI

struct ProductGridCell: View {
    
    @Binding var isAddedToCard: Bool
    @Binding var isProductWeightInKg: Bool
    
    let model: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            configureGoodsCard()
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.system(size: 12))
                    .padding(.init(top: 0, leading: 4, bottom: 0, trailing: 4))
            }
            Spacer()
            bottomPriceView()
        }

        .background(Color.white)
        .frame(width: 168, height: 278)
        .clipShape(CustomCorner(radius: 16, corners: [.topLeft, .topRight]))
        .clipShape(CustomCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))
        .shadow(color: Color(.cellShadow).opacity(0.2), radius: 8)
    }
    
    @ViewBuilder private func configureGoodsCard() -> some View {
        VStack {
            Group {
                HStack(alignment: .top) {
                    Image(.blowToPrices)
                    Spacer()
                    VStack {
                        Button(action: {
                            
                        }, label: {
                            Image(.orderlist)
                        })
                        Button(action: {
                            
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
                    .clipShape(CustomCorner(radius: 16, corners: .bottomLeft))
                }
                Spacer()
                HStack(spacing: 2) {
                    Image(.star)
                    Text(model.rate.description)
                        .font(.system(size: 12))
                        .foregroundStyle(.black).opacity(0.8)
                    Spacer()
                    if model.sale {
                        Text("\(model.saleAmount.description)%")
                            .foregroundStyle(.discount)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                .padding(.init(top: 0, leading: 4, bottom: 0, trailing: 4))
            }
        }
        .frame(width: 168, height: 168)
        .background {
            Image(model.image, bundle: nil)
        }
    }
    
    @ViewBuilder private func bottomPriceView() -> some View {
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
                    
                }, label: {
                    Image(.addToCard)
            })
            }
        }
        .padding(.init(top: 0, leading: 4, bottom: 4, trailing: 4))
        .frame(width: 168)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridCell(isAddedToCard: .constant(true),
                      isProductWeightInKg: .constant(true),
                      model: Product(sale: true, newProduct: false, isFavorite: false, addedInList: false, blowToPrice: true, countryOfOrigin: "Франция 🇫🇷", image: "firstImage", title: "сыр Ламбер 500/0 230г сыр Ламбер 500/0 230г", rate: 4.1, rateAmount: 19, price: 99999, priceCent: 90, oldPrice: 190.89, saleAmount: 25))
    }
}
