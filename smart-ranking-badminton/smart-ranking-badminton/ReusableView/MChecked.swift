//
//  MChecked.swift
//  smart-ranking-badminton
//
//  Created by PRO on 12/5/25.
//

import UIKit


class MChecked: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnCheckedOrUncheck: UIButton!
    @IBOutlet weak var lbText: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXib()
        setupViews()
    }
    
    private func loadXib() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("MChecked", owner: self, options: nil)
        
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupViews() {
        btnCheckedOrUncheck.setImage(UIImage(named: "47"), for: .normal)
        lbText.font = .systemFont(ofSize: 13)
        lbText.textColor = .black
    }
    
    func configView(text: String = "",
                    textColor: UIColor = .black,
                    font: UIFont = .systemFont(ofSize: 13)) {
        lbText.text = text
        lbText.textColor = textColor
        lbText.font = font
    }
}
