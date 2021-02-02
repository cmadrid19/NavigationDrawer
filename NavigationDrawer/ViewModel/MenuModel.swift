//
//  MenuModel.swift
//  NavigationDrawer
//
//  Created by Maxim Macari on 1/2/21.
//

import SwiftUI

//Meenu data
class MenuViewModel: ObservableObject {
    
    //Default
    @Published var selectedMenu = "Catalogue"
    
    //show
    @Published var showDrawer = false
}
