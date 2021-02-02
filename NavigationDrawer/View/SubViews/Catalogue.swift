//
//  Catalogue.swift
//  NavigationDrawer
//
//  Created by Maxim Macari on 1/2/21.
//

import SwiftUI

struct Catalogue: View {
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    VStack(alignment: .leading, spacing: 15, content: {
                        Image("homepad")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                            .offset(x: -20, y: -10)
                        
                        Text("Apple Homepad")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                        
                        Text("Great music with affordable price!!!")
                            .foregroundColor(.gray)
                    })
                    .padding(.bottom, 45)
                    .padding(.leading, 7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        Color.primary.opacity(0.06)
                            .cornerRadius(29)
                            .padding(.top, 70)
                    )
                    .offset(x: 70)
                    .overlay(
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bag.fill")
                                .font(.title)
                                //for dark mode
                                .foregroundColor(scheme == .dark ? .black : .white)
                                .padding()
                                .background(Color.primary)
                                .cornerRadius(15)
                        })
                        .offset(x: -30 , y: 35)
                        ,alignment: .bottomTrailing
                    )
                    .padding(.vertical, 35)
                    
                    //CardView...
                    CardView(image: "google-home", title: "Google Home")
                        .padding(.top, 25)
                    
                    CardView(image: "alexa", title: "Alexa")
                    
                    Spacer()
                }
                
            }.navigationTitle("Catalogue")
                
        }
    }
}

struct Catalogue_Previews: PreviewProvider {
    static var previews: some View {
        Catalogue()
            .previewDevice("iPhone 8")
    }
}

struct CardView: View {
    var image: String
    var title: String
    
    var body: some View {
        HStack(spacing: 15){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Great music with beest price")
                    .font(.caption)
                    .foregroundColor(.gray)
            })
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
