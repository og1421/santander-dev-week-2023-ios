//
//  FeatureView.swift
//  Santander
//
//  Created by Orlando Moraes Martins on 26/07/23.
//

import SwiftUI

struct FeatureView: View {
    //MARK: - Properties
    @StateObject var viewModel = FeatureViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(viewModel.features, id:  \.id) { feature in
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 110, height: 96)
                        .background(.white)
                        .cornerRadius(6)
                        .shadow(color: .black.opacity(0.15), radius: 4.5, x: .zero, y: 4 )
                        .overlay {
                            VStack{
                                AsyncImage(from: URL(string: feature.iconUrl), frame: CGSize(width: 30, height: 30)) { image in
                                    image
                                        .renderingMode(.template)
                                        .foregroundColor(Color.santanderRed)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                Spacer()
                                
                                Text(feature.description)
                                    .font(.openSansSemiBold(size: 14))
                                    .kerning(0.14)
                                    .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57))
                            }
                            .padding(.vertical, 19.0)
                        }
                        .padding(.horizontal, 7)
                }
            }
            .padding(.horizontal, 25)
        }
    }
}

//MARK: - Preview
struct FeatureView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureView()
    }
}
