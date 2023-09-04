//
//  MenuContent.swift
//  StarbucksCloneApp
//
//  Created by Kader Oral on 27.08.2023.
//

import UIKit

enum ContentTitle: CaseIterable{
    case drink
    case foods
    case coffeeAtHome
    case merchandise
    
    var title: String{
        
        switch self {
        case .drink:
            return "Drink"
        case .foods:
            return "Foods"
        case .coffeeAtHome:
            return "Coffee At Home"
        case .merchandise:
            return "Merchandise"
        }
    }
    
}


class PageContent {
    var name: String?
    var image: UIImage?
    
    
    
}

class MenuContent: PageContent {
    var title: String?
    var type: ContentTitle?
    
    init( type: ContentTitle?,name: String,image: UIImage?) {
        super.init()
        self.title = type?.title
        self.type = type
        self.name = name
        self.image = image
    }
    
    
}

class FeaturedContent: PageContent{
    
    init(name: String, image: UIImage?) {
        super.init()
        self.name = name
        self.image = image
    }
}

class FavoritesContent: PageContent{
    init(name: String, image: UIImage?) {
        super.init()
        self.name = name
        self.image = image
    }
}
class OrderContent: PageContent{
    init(name: String, image: UIImage?) {
        super.init()
        self.name = name
        self.image = image
    }
}


let favContent:[FavoritesContent] = [
    FavoritesContent(name: "Favorite Item 1", image: UIImage(named: "bottle")),
    FavoritesContent(name: "Favorite Item 2", image: UIImage(named: "bottle")),
    FavoritesContent(name: "Favorite Item 3", image: UIImage(named: "coffe"))
]

let fContent:[FeaturedContent] = [
    FeaturedContent(name: "FeaturedContent Item 1", image: UIImage(named: "featured")),
    FeaturedContent(name: "FeaturedContent Item 2", image: UIImage(named: "bottle")),
    FeaturedContent(name: "FeaturedContent Item 3", image: UIImage(named: "bottle")),
    FeaturedContent(name: "FeaturedContent Item 4", image: UIImage(named: "featured")),
]

let mContent:[MenuContent] = [
    MenuContent(type: .drink, name :"Chocolatey Waffle Cone Frappuccino" ,image: UIImage(named: "Chocolatey Waffle Cone Frappuccino")),
    MenuContent(type: .drink, name :"Strawberry Waffle Cone Cream Frappuccino" ,image: UIImage(named: "Strawberry Waffle Cone Cream Frappuccino")),
    MenuContent(type: .drink, name :"Mango Dragonfruit Starbucks Refresha" ,image: UIImage(named: "Mango Dragonfruit Starbucks Refresha")),
    MenuContent(type: .coffeeAtHome, name :"Starbucks® Odyssey Blend" ,image: UIImage(named: "featured")),
    MenuContent(type: .coffeeAtHome, name :"Starbucks Blonde® Espresso Roast" ,image: UIImage(named: "Starbucks Blonde® Espresso Roast")),
    MenuContent(type: .coffeeAtHome, name :"House Blend" ,image: UIImage(named: "House Blend")),
    MenuContent(type: .foods, name:"Limonlu Cheesecake" ,image: UIImage(named: "Limonlu Cheesecake")),
    MenuContent(type: .foods, name:"cookie",image: UIImage(named: "cookie")),
    MenuContent(type: .foods, name:"Brownie Cheesecake",image: UIImage(named: "Brownie Cheesecake")),
    MenuContent(type: .merchandise, name :"Starbucks® Paslanmaz Çelik Şişe"  ,image: UIImage(named: "Starbucks® Paslanmaz Çelik Şişe")),
    MenuContent(type: .foods, name:"cookie",image: UIImage(named: "cookie")) /* bos drink getiriyor */
]

let oContent:[OrderContent] = [
    OrderContent(name: "Starbucks", image: UIImage(named: "logo")),
    OrderContent(name: "Starbucks", image: UIImage(named: "logo")),
    OrderContent(name: "Starbucks", image: UIImage(named: "logo"))
]


