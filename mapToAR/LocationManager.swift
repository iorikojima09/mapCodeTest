//
//  LocationManager.swift
//  mapToAR
//
//  Created by 小島伊織 on 2021/03/19.
//

import MapKit

//現在地を取得するためのクラス
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    //ロケーションマネージャーを作る
    let manager = CLLocationManager()
    //領域の更新をパブリッシュする
    @Published var region = MKCoordinateRegion()
    
    override init() {
        super.init()
        manager.delegate = self //デリゲートの設定
        manager.requestWhenInUseAuthorization() //プライバシー設定の確認
    }
}
