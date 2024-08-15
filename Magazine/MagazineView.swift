//
//  MagazineView.swift
//  Magazine
//
//  Created by Vladislav Avrutin on 14.08.2024.
//

import SwiftUI

struct MagazineView: View {
    
    @StateObject var viewModel = MagazineViewModel()
    
    @State var isDisplayAsGrid = false
    @State var isAddedToCard = false
    @State var isProductWeightInKg = true
    @State var cardList: [Product] = []
    @State private var products: [Product] = []
    
    var body: some View {
        VStack {
            HStack {
                topButtons()
                    .padding(.init(top: 0, leading: 27, bottom: 0, trailing: 0))
                Spacer()
                
            }
            Divider()
                .scaledToFill()
                .foregroundStyle(.divider)
            if isDisplayAsGrid {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 168))], content: {
                        ForEach($products, id: \.self) { $item in
                            ProductGridCell(isAddedToCard: $isAddedToCard, isProductWeightInKg: $isProductWeightInKg, model: item)
                        }
                    })
                }
            }
            else {
                List($products) { item in
                    ProductListCell(isAddedToCard: $isAddedToCard, isProductWeightInKg: $isProductWeightInKg, model: item)
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
                        .listRowSeparator(.hidden)
                        .listRowSpacing(0)
                    Divider()
                        .frame(height: 2)
                        .scaledToFill()
                }
                .listStyle(.plain)
            }
        }
        .onAppear {
            products = viewModel.MOKEData
        }
    }

    @ViewBuilder private func topButtons() -> some View {
        HStack {
            Button(action: {
                isDisplayAsGrid.toggle()
            },
                   label: {
                if isDisplayAsGrid {
                    Image(.displayGrid)
                } else {
                    Image(.displayList)
                }
            })
        }
    }
}
#Preview {
    MagazineView()
}
