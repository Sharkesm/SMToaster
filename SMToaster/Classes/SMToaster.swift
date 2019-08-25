import UIKit

@available(iOS 9.0, *)
public class SMToaster: UIView {
    
    // Default content
    private(set) var title: String = "Toast title"
    private(set) var message: String = "Toast message"
    
    // UILabel properties
    private let titleLabel: UILabel = UILabel()
    private let messageLabel: UILabel = UILabel()
    
    // Style properties
    private var shadowBgColor: CGColor {
        return UIColor(red: 220/255.0, green: 221/255.0, blue: 225/255.0, alpha: 1.0).cgColor
    }
    
    private var borderColor: CGColor {
        return UIColor(red: 245/255.0, green: 246/255.0, blue: 250/255.0, alpha: 1.0).cgColor
    }
    
    // Font family properties
    public var titleFontFamily: String = "HelveticaNeue-Bold"
    public var messageFontFamily: String = "HelveticaNeue-Regular"
    public var titleFontSize: CGFloat = 18.0
    public var messageFontSize: CGFloat = 10.0
    
    // MARK: - Initializer Methods
    public override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.text = title
        messageLabel.text = message
        setupViews()
    }
    
    public convenience init(title: String, message: String) {
        self.init(frame: CGRect.zero)
        self.title = title
        self.message = message
        self.titleLabel.text = title
        self.messageLabel.text = message
        setupViews()
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
        setupViews()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
}


// MARK: - Private Methods
@available(iOS 9.0, *)
private extension SMToaster {
    
    func setupViews() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.borderColor = borderColor
        layer.borderWidth = 1.2
        layer.shadowColor = shadowBgColor
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.6
        
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = UIFont(name: titleFontFamily, size: titleFontSize)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .left
        messageLabel.adjustsFontSizeToFitWidth = true
        messageLabel.font = UIFont(name: messageFontFamily, size: messageFontSize)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
        // Check if toast view is displayed on screen
        if !isDisplayedOnScreen() {
            removeFromSuperview()
            return
        }
        
        if let containerView = superview {
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15),
                rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15),
                bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -50),
                heightAnchor.constraint(equalToConstant: 100)
            ])
        } else {
            removeFromSuperview()
        }
    }
    
    
    func isDisplayedOnScreen() -> Bool {
        return ((!isHidden) || (superview != nil))
    }
    
}
