//
//  InfluenceTableViewCell.swift
//  RedAttackCalculator
//
//  Created by Сергей Денисенко on 29.03.2024.
//
import UIKit
final class InfluenceTableViewCell: UITableViewCell {
    static let identifier = "InfluenceTableViewCell"

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Home"
        return label
    }()

    private lazy var influenceSwitch: UISwitch = {
        let button = UISwitch()
        button.onTintColor = .systemBlue
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
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

    private func setupView() {
        self.selectionStyle = .none
        self.backgroundColor = .systemGray6
        self.clipsToBounds = true
        [titleLabel, influenceSwitch].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
            self.addSubview($0)
        }
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            influenceSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            influenceSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
