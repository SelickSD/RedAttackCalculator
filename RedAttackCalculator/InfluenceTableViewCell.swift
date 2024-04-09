//
//  InfluenceTableViewCell.swift
//  RedAttackCalculator
//
//  Created by Сергей Денисенко on 29.03.2024.
//
import UIKit
final class InfluenceTableViewCell: UITableViewCell {
    static let identifier = "InfluenceTableViewCell"

    private var titleAnchor = NSLayoutConstraint()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 7, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private lazy var influenceSwitch: UISwitch = {
        let button = UISwitch()
        button.onTintColor = .systemBlue
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setSwitchOn() {
        influenceSwitch.setOn(true, animated: true)
    }

    func setSwitchOff() {
        influenceSwitch.setOn(false, animated: true)
    }

    func configCell(event: InfluenceEvents) {
        titleLabel.text = event.nameString
        if let text = event.event {
            descriptionLabel.text = text
            titleAnchor = titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        } else {
            titleAnchor = titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        }

        setupView()
    }

    private func setupView() {
        [titleLabel, influenceSwitch, descriptionLabel].forEach{
            $0.removeFromSuperview()
        }
        self.selectionStyle = .none
        self.backgroundColor = .systemGray6
        self.clipsToBounds = true
        [titleLabel, influenceSwitch, descriptionLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
            self.addSubview($0)
        }

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleAnchor,

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 40),

            influenceSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            influenceSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])

        self.layoutIfNeeded()
    }
}
