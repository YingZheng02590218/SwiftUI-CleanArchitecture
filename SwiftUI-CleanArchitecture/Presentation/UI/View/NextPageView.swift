//
//  NextPageView.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/15.
//

import SwiftUI

struct NextPageView: View {
    var name: String
    var gender: String
    var createdDay: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("あなたのプロフィール")
                    .font(.system(size: 28, weight: .semibold, design: .default))
                Text("名前：\(name)")
                Text("性別：\(gender)")
                Text("登録日：\(createdDay)")
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

struct NextPageView_Previews: PreviewProvider {
    static var previews: some View {
        NextPageView(name: "佐々木 謙", gender: "男", createdDay: "2022年3月1日")
    }
}
