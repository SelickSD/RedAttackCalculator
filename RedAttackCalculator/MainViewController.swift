//
//  MainViewController.swift
//  RedAttackCalculator
//
//  Created by Сергей Денисенко on 29.03.2024.
//
import UIKit
final class MainViewController: UIViewController {

    private let events: [InfluenceEvents] = [.plain, .swamp, .mountains,
                                     .desert, .river, .volga,
                                     .lake, .city, .redCity,
                                     .sourceOfSupply, .freeTerritory,
                                     .railway, .cossackCircle,
                                     .occupationLine
    ]

    private var selectedEvents: [InfluenceEvents] = []

    private lazy var configSideLabel: UILabel = {
        let label = UILabel()
        label.text = "Выбери атакующую армию"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private lazy var influenceTableLabel: UILabel = {
        let label = UILabel()
        label.text = "Выбери местность гекса"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private lazy var redButton: UIButton = {
        //        let cancelButtonName = NSLocalizedString("pagesView.cancelButtonName",
        //                                                 comment: "Text displayed like name of cancel button")
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .iRedColor
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.setTitle("Красные", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.addTarget(self, action: #selector(didTapRedButton), for: .touchUpInside)
        button.setTitleColor(.iWhite, for: .normal)
        return button
    }()

    private lazy var whiteButton: UIButton = {
        //        let cancelButtonName = NSLocalizedString("pagesView.cancelButtonName",
        //                                                 comment: "Text displayed like name of cancel button")
        let button = UIButton()
        button.setTitle("Белые", for: .normal)
        button.setTitleColor(.iRed, for: .normal)
        button.backgroundColor = .iWhiteColor
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.addTarget(self, action: #selector(didTapWhiteButton), for: .touchUpInside)
        return button
    }()

    private lazy var influenceTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.register(InfluenceTableViewCell.self,
                           forCellReuseIdentifier: InfluenceTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        drawSelf()
    }

    @objc private func didTapRedButton() {

    }

    @objc private func didTapWhiteButton() {

    }

    private func drawSelf() {
        [configSideLabel, redButton, whiteButton, 
         influenceTableView, influenceTableLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            configSideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            configSideLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            configSideLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            configSideLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            redButton.topAnchor.constraint(equalTo: configSideLabel.bottomAnchor, constant: 16),
            redButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -4),
            redButton.heightAnchor.constraint(equalToConstant: 80),

            whiteButton.topAnchor.constraint(equalTo: configSideLabel.bottomAnchor, constant: 16),
            whiteButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 4),
            whiteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            whiteButton.heightAnchor.constraint(equalToConstant: 80),

            influenceTableLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            influenceTableLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            influenceTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            influenceTableLabel.centerYAnchor.constraint(equalTo: redButton.bottomAnchor, constant: 40),

            influenceTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            influenceTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            influenceTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            influenceTableView.topAnchor.constraint(equalTo: redButton.bottomAnchor, constant: 50)
        ])
    }
}

//MARK: -UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = selectedEvents.firstIndex(of: events[indexPath.row]) {
            selectedEvents.remove(at: index)
        } else {
            selectedEvents.append(events[indexPath.row])
        }

        let cell = tableView.cellForRow(at: indexPath) as? InfluenceTableViewCell
        cell?.influenceSwitchToggle()
    }
}

//MARK: -UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfluenceTableViewCell.identifier,
                                                       for: indexPath) as? InfluenceTableViewCell else {
            return UITableViewCell()
        }

        let event = events[indexPath.row]
        if selectedEvents.contains(event) {
            cell.configCell(event: event, isActiveEvent: true)
        } else {
            cell.configCell(event: event, isActiveEvent: false)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
