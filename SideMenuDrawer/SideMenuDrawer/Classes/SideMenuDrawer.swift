
public class SideMenuDrawer: UIView, SideMenuDrawerDelegate {
  
    //MARK: fileprivate properties
    fileprivate var drawerView: UIView
    fileprivate var backgroundView = UIView()
    fileprivate let height = UIScreen.main.bounds.height
    fileprivate var width = CGFloat()
    fileprivate var currentViewController = UIViewController()
    
    //MARK: public properties
    public var containerView : UIStackView = {
        let instance = UIStackView()
        instance.axis = .vertical
        instance.spacing = 0
        instance.alignment = .center
        instance.translatesAutoresizingMaskIntoConstraints = false
        return instance
    }()
    
    //MARK: Setting DrawingView Width
    fileprivate func setupDrawerWidth() {
        if UIDevice.current.userInterfaceIdiom == .phone {
            width = UIScreen.main.bounds.width/2+75
        } else {
            width = UIScreen.main.bounds.width/2 - 75
        }
    }
    //MARK: Initilizers
    convenience public init(controller:UIViewController) {
        self.init(frame: UIScreen.main.bounds)
        setupDrawerWidth()
        self.initialise(controller:controller)
    }
    
    override private init(frame: CGRect) {
        self.drawerView = UIView(frame:CGRect(x:0, y:0, width:width, height:height))
        super.init(frame: frame)
        
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Setup Views
    private  func initialise(controller:UIViewController) {
        
        currentViewController = controller
        currentViewController.tabBarController?.tabBar.isHidden = true
        
        backgroundView.frame = UIScreen.main.bounds
        drawerView.backgroundColor = UIColor.white
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.4
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action:  #selector(SideMenuDrawer.dismissVC))
        swipeGesture.direction = .left
        backgroundView.addGestureRecognizer(swipeGesture)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SideMenuDrawer.dismissVC))
        backgroundView.addGestureRecognizer(tap)
        addSubview(backgroundView)
        
        drawerView.frame = CGRect(x:0, y:0, width:width, height:height)
        drawerView.clipsToBounds = true

        addSubview(drawerView)
        drawerView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: self.drawerView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: self.drawerView.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.drawerView.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.drawerView.heightAnchor).isActive = true
        
    }
    //MARK: Dismiss Drawer
    @objc private func dismissVC() {
        currentViewController.tabBarController?.tabBar.isHidden = false
        UIApplication.shared.statusBarView?.isHidden = false
        self.dissmiss()
    }
    
}
//MARK: StatusBar View
fileprivate extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}


//MARK: Protocols
public protocol SideMenuDrawerDelegate{
    func show()
    func dissmiss()
}


//MARK: Protocols Methods implementation
public extension SideMenuDrawerDelegate where Self:SideMenuDrawer{
//MARK: Show Drawer
    func show(){
        self.drawerView.frame.origin = CGPoint(x:-self.frame.size.width, y:0)
        backgroundView.alpha = 0.0
        
        UIApplication.shared.delegate?.window??.rootViewController?.view.addSubview(self)
        UIView.animate(withDuration: 0.3) {
            
            self.backgroundView.alpha = 0.6
            self.drawerView.frame.origin = CGPoint(x:0, y:0)
            
        }
    }
//MARK: Dismiss Drawer
    func dissmiss(){
        UIView.animate(withDuration: 0.2, animations: {
            self.drawerView.frame.origin = CGPoint(x:-self.frame.size.width, y:0)
            self.backgroundView.alpha = 0.0
            
        }) { (completion) in
            self.removeFromSuperview()
        }
    }
    
}
