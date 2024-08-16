//
//  QuantityOfAddedProduct.swift
//  Magazine
//
//  Created by Vladislav Avrutin on 15.08.2024.
//

import SwiftUI

struct QuantityOfAddedProduct: View {
    
    @Binding var model: Product
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Spacer()
                    Text("Шт")
                        .padding(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .font(!model.isProductWeightInKg ? .system(size: 14, weight: .medium) : .system(size: 14))
                        .foregroundStyle(!model.isProductWeightInKg ? .twoSix : .twoSix.opacity(0.6))
                        .onTapGesture {
                            
                        }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(!model.isProductWeightInKg ? .white : .productQuantity)
                .clipShape(CustomCorner(radius: 8))
                
                HStack {
                    Spacer()
                    Text("Кг")
                        .padding(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .font(model.isProductWeightInKg ? .system(size: 14, weight: .medium) : .system(size: 14))
                        .foregroundStyle(model.isProductWeightInKg ? .twoSix : .twoSix.opacity(0.6))
                        .onTapGesture {
                            
                        }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(model.isProductWeightInKg ? .white : .productQuantity)
                .clipShape(CustomCorner(radius: 8))
            }
            .frame(height: 28)
            .background(Color.productQuantity)
            .clipShape(CustomCorner(radius: 8))
            
            HStack {
                Image(systemName: "minus")
                        .frame(width: 14, height: 2)
                        .padding(11)
                        .onTapGesture {
                            
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
                    Image(systemName: "plus")
                        .frame(width: 14, height: 2)
                        .padding(11)
                        .onTapGesture {
                            
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


