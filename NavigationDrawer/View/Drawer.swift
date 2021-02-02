//
//  Drawer.swift
//  NavigationDrawer
//
//  Created by Maxim Macari on 1/2/21.
//

import SwiftUI

struct Drawer: View {
    
    @EnvironmentObject var menuData: MenuViewModel
    
    //Animation
    var animation: Namespace.ID
    
    var body: some View {
        VStack{
            HStack{
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Spacer()
                
                //Close button
                if menuData.showDrawer {
                    DrawerCloseButton(animation: animation)
                }
                
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Hello")
                    .font(.title2)
                
                Text("Helena Roy")
                    .font(.title)
                    .fontWeight(.heavy)
            })
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 5)
            
            //Menu buttons...
            
            VStack(spacing: 22){
                
                MenuButton(name: "Catalogue", image: "envelope.fill", selectedMenu: $menuData.selectedMenu, animation: animation)
                
                MenuButton(name: "Cart", image: "bag.fill", selectedMenu: $menuData.selectedMenu, animation: animation)
                
                MenuButton(name: "Favourites", image: "suit.heart.fill", selectedMenu: $menuData.selectedMenu, animation: animation)
                
                MenuButton(name: "Orders", image: "list.triangle", selectedMenu: $menuData.selectedMenu, animation: animation)
                
                    
            }
            .padding(.leading)
            .frame(width: 250, alignment: .leading)
            .padding(.top, 30)
            
            Divider()
                .background(Color.white)
                .padding(.top, 30)
                .padding(.horizontal, 25)
            
            Spacer()
            
            MenuButton(name: "Sign out", image: "rectangle.righthalf.inset.fill.arrow.right", selectedMenu: .constant(""), animation: animation)
                .padding(.bottom)
            
        }
        
        //Defaukt size
        .frame(width: 250)
        .background(
            Color("drawer-bg")
                .ignoresSafeArea(.all, edges: .vertical)
        )
    }
}

struct Drawer_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//Close button...

struct DrawerCloseButton: View {
    @EnvironmentObject var menuData: MenuViewModel
    var animation: Namespace.ID
    var body: some View{
        
        Button(action: {
            
            withAnimation(.easeInOut){
                menuData.showDrawer.toggle()
            }
            
        }, label: {
            
            VStack(spacing: 5){
                Capsule()
                    .fill(menuData.showDrawer ? Color.white : Color.primary)
                    .frame(width: 35, height: 3)
                    .rotationEffect(.init(degrees: menuData.showDrawer ? -50 : 0))
                //adjusting x
                    .offset(x: menuData.showDrawer ? 2 : 0, y: menuData.showDrawer ? 9 : 0)
                
                VStack(spacing: 5){
                    
                    Capsule()
                        .fill(menuData.showDrawer ? Color.white : Color.primary)
                        .frame(width: 35, height: 3)
                    
                    
                    Capsule()
                        .fill(menuData.showDrawer ? Color.white : Color.primary)
                        .frame(width: 35, height: 3)
                    
                    //moving this view to hide
                        .offset(y: menuData.showDrawer ? -8 : 0)
                }
                //Rotating to xMark
                .rotationEffect(.init(degrees: menuData.showDrawer ? 50 : 0))
                
            }
            .padding(5)
        })
        //Making it like small
        .scaleEffect(0.8)
        .matchedGeometryEffect(id: "MEENU_BUTTON", in: animation)
    }
}
