//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Nayeong Kim on 2022/11/23.
//

import SwiftUI

struct CategoryHome: View {
    var body: some View {
        NavigationView{
            Text("hello, world")
                .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
