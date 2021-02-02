//
//  Home.swift
//  NavigationDrawer
//
//  Created by Maxim Macari on 1/2/21.
//

import SwiftUI

struct Home: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @StateObject var menuData = MenuViewModel()
    @Namespace var animation
    
    var body: some View {
        HStack(spacing: 0){
            //Draweer and main view
            
            //Drawer
            Drawer(animation: animation)
            
            TabView(selection: $menuData.selectedMenu){
                Catalogue()
                    .tag("Catalogue")
                
                Orders()
                    .tag("Orders")
                
                Cart()
                    .tag("Cart")
                
                Favourites()
                    .tag("Favourites")
            }
            .frame(width: UIScreen.main.bounds.width)
            
        }
        //max frame
        .frame(width: UIScreen.main.bounds.width)
        //moving view
        //250 / 2 = 125
        .offset(x: menuData.showDrawer ? 125 : -125)
        .overlay(
            ZStack{
                if !menuData.showDrawer {
                    DrawerCloseButton(animation: animation)
                        .padding()
                }
            },
            alignment: .topLeading
            
        )
        
        //Setting as evironment object
        //For avoiding re-declarations, any child of Home() can access menuData
        .environmentObject(menuData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
