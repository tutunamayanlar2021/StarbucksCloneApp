//
//  HomePage.swift
//  StarbucksCloneApp
//
//  Created by Kader Oral on 18.08.2023.
//

import UIKit

class HomePage: UIViewController{
    
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var homeTableView: UITableView!
    
    let button = UIButton()
    
    let buttonQr = UIButton()
    
    let buttonCount = UIButton()
    var headerViewTopConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureButton(button, y: 650,x:225 ,title: "Add Money",rds: 20,height: 50,width : 170, backgroundColor: UIColor.white,fontColor: UIColor.black,fontSize:20)
        configureButton(buttonQr, y: 712,x:260,title: "Scan QR",rds: 30,height: 65,width : 135, backgroundColor: UIColor(named: "starbucksGreen") ?? UIColor.systemPink,fontColor: UIColor.white,fontSize:20)
        configureButton(buttonCount, y: 705,x:330, title: "₺0.00",rds: 15,height: 30, width : 65,backgroundColor: UIColor.white,fontColor: UIColor.black, fontSize:12 )
        
    
        homeTableView.delegate = self
        homeTableView.dataSource = self
   
        addWavyBadge(to: messageButton!)
        
        homeTableView.showsVerticalScrollIndicator = false
        
        
    }
    
    func configureButton(_ button: UIButton, y: CGFloat,x: CGFloat, title: String ,rds radius: Double, height :Double,width : Double, backgroundColor :UIColor, fontColor: UIColor , fontSize: Double) {
        button.backgroundColor = backgroundColor
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize, weight: .medium)
            
        ]
        
        let attributedText = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedText, for: .normal)
        button.setTitleColor(fontColor, for: .normal)
        button.layer.cornerRadius = radius
        applyShadow(to: button)
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        view.addSubview(button)
    }
    
    func applyShadow(to view: UIView ) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
    }
    
    
}


func addWavyBadge(to button: UIButton) {
    let badgeSize: CGFloat = 15
    
    // Yeşil yuvarlak badge oluşturma
    let badgeLabel = UILabel(frame: CGRect(x: -4, y: -8, width: badgeSize, height: badgeSize))
    badgeLabel.backgroundColor = UIColor(named: "starbucksGreen")
    badgeLabel.textColor = .white
    badgeLabel.textAlignment = .center
    badgeLabel.layer.cornerRadius = badgeSize / 2
    
    badgeLabel.clipsToBounds = true
    
    // Dalgalı kenarlık oluşturma
    let shapeLayer = CAShapeLayer()
    let path = UIBezierPath(arcCenter: CGPoint(x: badgeSize / 2, y: badgeSize / 2), radius: badgeSize / 2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
    shapeLayer.path = path.cgPath
    shapeLayer.fillColor = UIColor.clear.cgColor
    
    shapeLayer.strokeColor = UIColor.white.cgColor
    shapeLayer.lineWidth = 2.0
    shapeLayer.lineJoin = .round
    shapeLayer.lineDashPattern = [2, 4]
    
    badgeLabel.layer.addSublayer(shapeLayer)
    
    button.addSubview(badgeLabel)
}



//MARK: - UITableViewDelegate,UITableViewDataSource
extension HomePage: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeCell
        tableView.showsVerticalScrollIndicator = false//cubuk kaldırma
        
        
        // Hücre etrafındaki boşluğu sıfıra ayarlama
        cell.contentView.layoutMargins = .zero
        cell.contentView.preservesSuperviewLayoutMargins = false
        
       
        cell.homeCellImageView.image = hContent[indexPath.row].image
        cell.homeCellTitleLabel.text = hContent[indexPath.row].contentTitle
        cell.homeCellIngredientLabel.text = hContent[indexPath.row].contentSubtitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // Seçili hücrenin seçimini kaldır
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {

            return 300
        } else {
            return tableView.rowHeight
        }
    }
    
    
}



//MARK: - UIScrollViewDelegate
extension HomePage: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        let y = scrollView.contentOffset.y
        let shouldSnap = y > 30
        let labelHeight = headerView.frame.height + 16
        
        
        UIView.animate(withDuration: 0.5) {
            self.navigationController?.navigationBar.prefersLargeTitles = !shouldSnap
            
        }
        
        let targetHeaderViewTopConstraint = shouldSnap ? -labelHeight : 0
        if y >= 0 {
            self.navigationController?.navigationBar.transform = .identity
            self.headerViewTopConstraint?.constant = 0
        } else if scrollView.contentOffset.y <= -labelHeight {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.headerViewTopConstraint?.constant = -labelHeight
        } else {
            self.headerViewTopConstraint?.constant = targetHeaderViewTopConstraint
        }
        self.view.layoutIfNeeded()
    }
}
