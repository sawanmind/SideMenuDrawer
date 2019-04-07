//
//  ViewController.swift
//  Example
//
//  Created by Sawan Kumar on 07/04/19.
//  Copyright © 2019 Sawan Kumar. All rights reserved.
//


import UIKit
import SideMenuDrawer


public struct DrawerModel {
    
    public var icon = UIImage()
    public var text = String()
   
    public init(icon:UIImage, text:String) {
        self.icon = icon
        self.text = text
      
    }
}


class ViewController: UIViewController {
    
    lazy var drawer = SideMenuDrawer(controller: self)
    var arrayElements = [DrawerModel]()
    
    public lazy var avatarImage : UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(named: "profile")
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            avatarImage.layer.cornerRadius = 30
        } else {
            avatarImage.layer.cornerRadius = 50
        }
        
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.layer.borderWidth = 3.0
        avatarImage.clipsToBounds = true
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.backgroundColor = UIColor.white
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    }()
    
    private lazy var editProfileBtn : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Edit Profile", for: UIControl.State())
        button.setTitleColor(UIColor.black, for: UIControl.State())
        button.layer.cornerRadius = 5.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var moreBtn : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setImage(UIImage(named:"more"), for: .normal)
        button.imageView?.tintColor  = UIColor.black
        button.imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    
    public let nameLabel : UILabel = {
        let textlabel = UILabel()
        textlabel.text = "Sawan Kumar"
        textlabel.font = UIFont.systemFont(ofSize: 20, weight: .black)
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        return textlabel
    }()
    
    
    public let subtitle : UILabel = {
        let textlabel = UILabel()
        textlabel.text = "@sawanmind"
        textlabel.font =  UIFont.systemFont(ofSize: 16, weight: .medium)
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        return textlabel
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDrawerView()
        setupTableViewDataSource()

        navigationItem.title = "View Controller"
        view.backgroundColor = UIColor.groupTableViewBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"menu"), style: .done,
                                                           target: self, action: #selector(handleMenu))
    }
  
    fileprivate func setupTableViewDataSource() {
        let Notification = DrawerModel(icon: #imageLiteral(resourceName: "icon"), text: "Notification")
        let Favourite = DrawerModel(icon: #imageLiteral(resourceName: "bookmark_ribbon"), text: "Favourite")
        let Comments = DrawerModel(icon: #imageLiteral(resourceName: "comments"), text: "Comments")
        let About = DrawerModel(icon: #imageLiteral(resourceName: "about"), text: "About")
        let Settings = DrawerModel(icon: #imageLiteral(resourceName: "settings"), text: "Settings")
        
        
        arrayElements.append(Notification)
        arrayElements.append(Favourite)
        arrayElements.append(Comments)
        arrayElements.append(About)
        arrayElements.append(Settings)
    }
    
    fileprivate func setupDrawerView() {
        let header = setupHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        
        self.drawer.containerView.addArrangedSubview(header)
        header.widthAnchor.constraint(equalTo: self.drawer.containerView.widthAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant:180).isActive = true
        
        let bottom = setupTableView()
        self.drawer.containerView.addArrangedSubview(bottom)
        bottom.widthAnchor.constraint(equalTo: self.drawer.containerView.widthAnchor).isActive = true
    }
    
    @objc fileprivate func handleMenu(){
         drawer.show()
    }
    
    private func setupHeaderView() -> UIView {
        let headerView = UIView()
        
        headerView.backgroundColor = UIColor().colorFromHexString("50A7C2")
        
        headerView.addSubview(avatarImage)
        avatarImage.topAnchor.constraint(equalTo: headerView.topAnchor,constant: 30).isActive = true
        avatarImage.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant:10).isActive = true
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            avatarImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
            avatarImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        } else {
            avatarImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
            avatarImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        
        
        headerView.addSubview(editProfileBtn)
        editProfileBtn.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor).isActive = true
        editProfileBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant:-10).isActive = true
        editProfileBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        editProfileBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        headerView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor,constant:17).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant:10).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: headerView.widthAnchor,constant:-10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        
        headerView.addSubview(subtitle)
        subtitle.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant:7).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant:10).isActive = true
        subtitle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        subtitle.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        
        headerView.addSubview(moreBtn)
        moreBtn.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor,constant:15).isActive = true
        moreBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant:-10).isActive = true
        moreBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        moreBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return headerView
    }
    
    private func setupTableView() -> UIView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SideMenuDrawerCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }
   
}



extension ViewController:  UITableViewDelegate, UITableViewDataSource{
    @objc func didTapButton() {
        self.drawer.dissmiss()
        let vc = ViewController2()
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuDrawerCell
        cell.textlabel.text = arrayElements[indexPath.row].text
        cell.iconImage.image = arrayElements[indexPath.row].icon
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.didTapButton()
    }
}
