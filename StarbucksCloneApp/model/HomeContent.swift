//
//  Drink.swift
//  StarbucksCloneApp
//
//  Created by Kader Oral on 20.08.2023.
//

import UIKit


struct HomeContent{
    let contentTitle: String
    let contentSubtitle: String
    let image: UIImage
}

let hContent:[HomeContent] = [
    
    HomeContent(contentTitle: "", contentSubtitle: "", image:  #imageLiteral(resourceName: "reward")),
    HomeContent(contentTitle: "Mastercard’la ⭐’lar Cebinde🧡", contentSubtitle: "Masterpass’e kayıtlı Mastercard’ınla her 200 TL’lik Starbucks® Mobil otomatik yükleme talimatına 5⭐, toplamda 10⭐ hediye!", image:  #imageLiteral(resourceName: "master")),
    HomeContent(contentTitle: "Dilediğin Gibi Öde Yıldız Kazan! ⭐", contentSubtitle: "Starbucks® Mobil’de yeni dönem başladı! Ödemeni nakit, kredi kartı veya Starbucks® Mobil ile yap, tüm harcamalarında yıldız kazantermos", image:  #imageLiteral(resourceName: "s1")),
    HomeContent(contentTitle: "Yaza renk katacak kupa ve termoslar seni bekliyor! 🥳", contentSubtitle: "Yazına renk katacak kupa ve termos ailemizin yeni üyeleriyle tanışmaya hazır mısın? 🥳 Çok seveceğin yeni Starbucks® kupa ve termosları Hepsiburada’da seni bekliyor!", image:  #imageLiteral(resourceName: "t")),
    HomeContent(contentTitle: "Kırmızı meyveli yaz esintisi! 🍇🌬", contentSubtitle: "4 yeni kırmızı meyveli lezzetimizle yazın serinletici etkisini keşfet! 🌬", image:  #imageLiteral(resourceName: "mam.jpeg"))
    
]
