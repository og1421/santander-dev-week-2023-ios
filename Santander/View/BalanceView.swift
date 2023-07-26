//
//  BalanceView.swift
//  Santander
//
//  Created by Orlando Moraes Martins on 26/07/23.
//

import SwiftUI

struct BalanceView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = BalanceViewModel()
    
    @State private var cardClosed = true
    @State private var isRotating = 180.00
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(.white)
            .frame(width: 333, height: cardClosed ? 75 : 250)
            .cornerRadius(6)
            .shadow(color: .black.opacity(0.15), radius: 4.5, x: 0, y: 4)
            .overlay(alignment: .topLeading, content: {
                VStack{
                    VStack(alignment: .leading){
                        HStack{
                            Image("money_icon")
                                .renderingMode(.template)
                                .foregroundColor(.santanderRed)
                                .frame(width: 25, height: 25)
                            
                            Text("Saldo disponível")
                                .font(.openSansSemiBold(size: 18))
                                .padding(.leading)
                                .kerning(0.18)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image("card_balance_icon")
                                .rotationEffect(.degrees(isRotating))
                                .frame(width: 23.2374, height: 11.65924)
                                .onTapGesture {
                                    withAnimation{
                                        isRotating = cardClosed ? 360.00 : 180
                                        cardClosed.toggle()
                                    }
                                }
                        }
                        if !cardClosed {
                            VStack (alignment: .leading) {
                                Text(viewModel.accountBalance)
                                    .font(.openSansBold(size: 32.4))
                                    .kerning(0.324)
                                    .foregroundColor(.black)
                                
                                Text(viewModel.balanceAndLimit)
                                    .font(.openSansSemiBold(size: 18))
                                    .kerning(0.18)
                                    .foregroundColor(.black)
                            }
                            .padding(.top, 17.0)
                        }
                    }
                    if !cardClosed {
                        VStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 283, height: 2)
                                .background(Color.santanderGray)
                                .cornerRadius(75)
                            Text("Ver extrato")
                                .font(.openSansSemiBold(size: 18))
                                .kerning(0.18)
                                .foregroundColor(Color.santanderRed)
                                .padding(.top, 4.0)
                        }
                        .padding(.top, 32.0)
                    }
                }
                .padding([.top, .leading, .trailing], 25.0)
            })
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
