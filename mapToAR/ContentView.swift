//
//  ContentView.swift
//  mapToAR
//
//  Created by 小島伊織 on 2021/03/17.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    //座標と領域を指定する
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.6805702,  //緯度
            longitude: 139.7676359 //経度
        ),
        latitudinalMeters: 1000.0, //南北距離
        longitudinalMeters: 1000.0 //東西距離
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*
 
*/
