
import UIKit

public class SideMenuDrawerCell : UITableViewCell {
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        
        contentView.addSubview(iconImage)
        iconImage.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 26).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        contentView.addSubview(textlabel)
        textlabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor,constant: 15).isActive = true
        textlabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor,constant: -15).isActive = true
        textlabel.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
        textlabel.heightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.heightAnchor).isActive = true
        
    }
    
  public  let iconImage : UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "icon")?.withRenderingMode(.alwaysTemplate)
        iconImage.tintColor = UIColor.black.withAlphaComponent(0.6)
        iconImage.contentMode = .scaleAspectFill
        iconImage.backgroundColor = UIColor.white
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        return iconImage
    }()
   
    
   public let textlabel : UILabel = {
        let textlabel = UILabel()
        textlabel.textColor = UIColor.black.withAlphaComponent(0.8)
        textlabel.font = UIFont(name: "Superclarendon-Regular", size: 14)
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        return textlabel
    }()
    
}

