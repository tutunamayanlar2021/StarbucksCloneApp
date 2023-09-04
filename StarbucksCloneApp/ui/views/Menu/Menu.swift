//
//  Menu.swift
//  StarbucksCloneApp
//
//  Created by Kader Oral on 27.08.2023.
//

import UIKit

class Menu: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet var menuBottomConstrain: [NSLayoutConstraint]!
    private var headerView: UIView? // HeaderView'ı sınıf düzeyinde saklayın
    
    private var selectedContactType: [PageContent] = mContent{
        didSet{
            menuTableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.separatorStyle = .none
        
    }
    
    
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        
        for (index,constraint ) in menuBottomConstrain.enumerated(){
            if index == sender.tag {
                constraint.constant = 5.0
                
            } else {
                // Diğer butonların constraint değerlerini sıfırla
                constraint.constant = 0.0
                
                headerView = nil
                
            }
        }
        
        switch (sender.tag){
        case 0:selectedContactType = mContent
        case 1:selectedContactType = fContent
        case 2:selectedContactType = favContent
        case 3:selectedContactType = oContent
        default:selectedContactType = []
            
        }
        menuTableView.reloadData()
        
    }
    
    
    
    
}
extension Menu : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedContactType is [MenuContent] {
            return filterContacts(section).count
        } else {
            return selectedContactType.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        
        if let menuContent = selectedContactType[indexPath.row] as? MenuContent {
            cell.menuTableViewImage.image = filterContacts(indexPath.section)[indexPath.row].image
            cell.menuTableViewLabel.text = filterContacts(indexPath.section)[indexPath.row].name
        } else {
            cell.menuTableViewImage.image = selectedContactType[indexPath.row].image
            cell.menuTableViewLabel.text = selectedContactType[indexPath.row].name
        }
        
        
        
        
        
        cell.menuTableViewImage.contentMode = .scaleAspectFit // veya başka bir uygun değer
        // Hücre etrafındaki boşluğu sıfıra ayarlama
        cell.contentView.layoutMargins = .zero
        cell.contentView.preservesSuperviewLayoutMargins = false
        return  cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
        headerView!.backgroundColor = UIColor.systemBackground
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: -5, width: headerView!.frame.width - 150, height: 30)) // Alt sınırı sıfıra ayarlayın
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.backgroundColor = UIColor.systemBackground
        
        let seeAllButtonWidth: CGFloat = 150
        let seeAllButton = UIButton(frame: CGRect(x: (headerView?.frame.width ?? 0) - seeAllButtonWidth, y: 10, width: seeAllButtonWidth, height: 10)) // Üst sınırı sıfıra ayarlayın
        seeAllButton.backgroundColor = UIColor.systemBackground
        seeAllButton.setTitleColor(.blue, for: .normal)
        
        if selectedContactType[section] is MenuContent {
            titleLabel.text = setSection()[section].title// Değişiklik burada
            seeAllButton.setTitle("See All (\(filterContacts(section).count))", for: .normal)
            seeAllButton.setTitleColor(UIColor(named: "starbucksGreen"), for: .normal)
            headerView!.addSubview(titleLabel)
            headerView!.addSubview(seeAllButton)
            
        }
        
        return headerView
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if selectedContactType is [MenuContent] {
            return setSection().count
        } else {
            return 1  // Diğer içerik türleri için sadece 1 bölüm
        }
    }
    //kategori türleri
    private func setSection() -> [ContentTitle] {
        var sectionTypes: [ContentTitle] = []
        for content in selectedContactType {
            if let menuContent = content as? MenuContent, let type = menuContent.type {
                if !sectionTypes.contains(type) {
                    sectionTypes.append(type)
                    
                }
            }
        }
        print("sectionTypes \(sectionTypes)--------\n")
        return sectionTypes
    }
    //menu içeriği
    private func filterContacts(_ sectionIndex: Int) -> [MenuContent] {
        let contactType: ContentTitle = setSection()[sectionIndex]
        
        let filteredContents = selectedContactType.compactMap { content -> MenuContent? in
            if let menuContent = content as? MenuContent, menuContent.type == contactType {
                print(menuContent.name!)
                return menuContent
                
            }
            return nil
        }
        
        return filteredContents
    }
}
