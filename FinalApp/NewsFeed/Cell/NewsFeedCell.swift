//
//  NewsFeedCell.swift
//  FinalApp
//
//  Created by ln on 10.09.2023.
//

import UIKit

protocol FeedCellViewModel {
    var iconUrlString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var lakes: String? { get }
    var comments: String? { get }
    var shares: String? { get }
    var views: String? { get }
}

final class NewsfeedCell: UITableViewCell {
    
    static let reuseId = "NeesfeedCell"
    
    // первый слой
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // второй слой
    let topView: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        return view
    }()
    
    let postlabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        label.font = Constants.postLabelFont
        label.textColor = #colorLiteral(red: 0.227329582, green: 0.2323184013, blue: 0.2370472848, alpha: 1)
        return label
    }()
    
    let postImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.8980392157, blue: 0.9098039216, alpha: 1)
        return imageView
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return view
    }()
    
    // третий слой
    
    private var iconImageView: UIImageView = {
        return UIImageView()
    }()
    
    private var nameLabel: UILabel = {
        return UILabel()
    }()
    
    private var dateLabel: UILabel = {
        return UILabel()
    }()
    
    private var postLabel: UILabel = {
        return UILabel()
    }()
    
    private var likesLabel: UILabel = {
        return UILabel()
    }()
    
    private var commentsLabel: UILabel = {
        return UILabel()
    }()
    
    private var sharesLabel: UILabel = {
        return UILabel()
    }()
    
    private var viewsLabel: UILabel = {
        return UILabel()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    func set(viewModel: FeedCellViewModel) {
        
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postlabel.text = viewModel.text
        likesLabel.text = viewModel.lakes
        commentsLabel.text = viewModel.views
        sharesLabel.text = viewModel.shares
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomViewFrame
        
        if let photoAttachment = viewModel.photoAttachement {
            //postImageView.set(imageURL: photoAttachment.photoUrlString)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
    
    func setupViews() {
        addSubview(cardView)
        cardView.addSubview(topView)
        cardView.addSubview(postlabel)
        cardView.addSubview(bottomView)
        
        cardView.fillSuperview(padding: Constants.cardInsets)
        
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            topView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight),
            
            ])

    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

