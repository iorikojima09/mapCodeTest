//
//  ContentView.swift
//  mapToAR
//
//  Created by 小島伊織 on 2021/03/17.
/*
 今実装されてる機能
 ・地図の表示
 ・3つの場所にピン打ち　そのピンの形とピンの色を変更
 
 今からやること
 ・現在地を表示して移動をフォロ
 */

import SwiftUI
import MapKit

//スポットの構造体
struct Spot: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct ContentView: View {
    //指し示す座標
    let spotlist = [
        Spot(latitude: 35.683932, longitude: 139.764075),
        Spot(latitude: 35.681038, longitude: 139.764568),
        Spot(latitude: 35.681666, longitude: 139.770362)
    ]
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
        Map(coordinateRegion: $region,
            annotationItems: spotlist,
            //annotationContent:{ spot in MapMarker(coordinate: spot.coordinate, tint: .orange)}
            annotationContent:{ spot in
                MapMarker(coordinate: spot.coordinate, tint: .orange)
                //MAPピンを改良したもの
                /*
                MapAnnotation(coordinate: spot.coordinate,
                              content: {
                                Image(systemName: "circle.fill").foregroundColor(Color(red: 1.0, green: 0.0, blue: 128.0, opacity: 128.0))
                              })
                */
            }
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


