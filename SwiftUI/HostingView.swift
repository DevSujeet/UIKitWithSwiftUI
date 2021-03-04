//
//  HostingView.swift
//  UIKitToSwiftUI
//
//  Created by Sujeet.Kumar on 17/02/21.
//

import SwiftUI
import Combine
/*
    REf:-
 https://www.sofapps.it/en/swiftuiframeworkprogramming-5.html
 https://daddycoding.com/2020/05/06/swiftui-observedobject/
 */
class HostingViewBinding:ObservableObject {

    @Published var color:UIColor = .red
    @Published var text = "hahaha"
    var onTapAction: ((String)->Void)!
}

struct HostingView: View {
    @ObservedObject var binder:HostingViewBinding
    var body: some View {
        let color = binder.color
        let text = binder.text
        VStack {
            Text(binder.text)
                .background(Color(binder.color))
                .onTapGesture(perform: {
                    self.binder.onTapAction(binder.text)
            })
            
            TextField("input", text: $binder.text)
        }
 
    }
}

struct HostingView_Previews: PreviewProvider {
    static var previews: some View {
        HostingView(binder: HostingViewBinding())
    }
}


