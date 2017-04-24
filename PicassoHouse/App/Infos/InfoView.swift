//
//  InfoView.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 17/04/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit
import Charts

class InfoView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate var chartTitleLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.text = "Histórico de Consumo"
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightBlack)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var chartView : BarChartView = {
        let view = BarChartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var historyChartView : UIView = {
        let view = UIView()
        view.addSubview(self.chartTitleLabel)
        view.addSubview(self.chartView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate var timeOnTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Tempo Ligado"
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    var timeOnLabel : UILabel = {
        let label = UILabel()
        label.text = "256 hr"
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 42, weight: UIFontWeightThin)
        return label
    }()
    
    fileprivate lazy var timeOnStackView : UIStackView = {
        let view = UIStackView(arrangedSubviews: [self.timeOnLabel, self.timeOnTitleLabel])
        view.distribution = .fill
        view.alignment = .leading
        view.spacing = 0
        view.axis = .vertical
        return view
    }()
    
    fileprivate var timeOffTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Tempo Desligado"
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    var timeOffLabel : UILabel = {
        let label = UILabel()
        label.text = "128 hr"
        label.font = UIFont.systemFont(ofSize: 42, weight: UIFontWeightThin)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    fileprivate lazy var timeOffStackView : UIStackView = {
        let view = UIStackView(arrangedSubviews: [self.timeOffLabel, self.timeOffTitleLabel])
        view.distribution = .fill
        view.alignment = .leading
        view.spacing = 0
        view.axis = .vertical
        return view
    }()
    
    
    fileprivate var infoTitleLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.text = "Informações do mês atual"
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightBlack)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var currentMonthView : UIStackView = {
        let view = UIStackView(arrangedSubviews: [self.timeOnStackView, self.timeOffStackView])
        view.distribution = .equalSpacing
        view.alignment = .center
        view.spacing = 0
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var currentMonthInfoWrapperView : UIView = {
        let view = UIView()
        view.addSubview(self.infoTitleLabel)
        view.addSubview(self.currentMonthView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}


// MARK - ViewConfiguration
// ---------------------------------
extension InfoView : ViewConfiguration {
    
    func buildViewHierarchy() {
        addSubview(historyChartView)
        addSubview(currentMonthInfoWrapperView)
    }
    
    func setupConstraints() {
        //First Row
        historyChartView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        historyChartView
            .topAnchor(equalTo: topAnchor)
            .leadingAnchor(equalTo: leadingAnchor)
            .trailingAnchor(equalTo: trailingAnchor)
        historyChartView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true

        chartTitleLabel
            .topAnchor(equalTo: historyChartView.layoutMarginsGuide.topAnchor)
            .leadingAnchor(equalTo: historyChartView.layoutMarginsGuide.leadingAnchor)
            .trailingAnchor(equalTo: historyChartView.layoutMarginsGuide.trailingAnchor)
        
        
        chartView
            .topAnchor(equalTo: chartTitleLabel.bottomAnchor)
            .leadingAnchor(equalTo: historyChartView.layoutMarginsGuide.leadingAnchor)
            .trailingAnchor(equalTo: historyChartView.layoutMarginsGuide.trailingAnchor)
            .bottomAnchor(equalTo: historyChartView.bottomAnchor)
        
        //Second Row
        currentMonthInfoWrapperView.layoutMargins = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
        currentMonthInfoWrapperView
            .topAnchor(equalTo: historyChartView.bottomAnchor)
            .leadingAnchor(equalTo: leadingAnchor)
            .trailingAnchor(equalTo: trailingAnchor)
            .bottomAnchor(equalTo: bottomAnchor)
        currentMonthInfoWrapperView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        infoTitleLabel
            .topAnchor(equalTo: currentMonthInfoWrapperView.layoutMarginsGuide.topAnchor)
            .leadingAnchor(equalTo: currentMonthInfoWrapperView.layoutMarginsGuide.leadingAnchor)
            .trailingAnchor(equalTo: currentMonthInfoWrapperView.layoutMarginsGuide.trailingAnchor)
        
            
        currentMonthView
            .topAnchor(equalTo: infoTitleLabel.bottomAnchor, constant: 10)
            .leadingAnchor(equalTo: currentMonthInfoWrapperView.layoutMarginsGuide.leadingAnchor)
            .trailingAnchor(equalTo: currentMonthInfoWrapperView.layoutMarginsGuide.trailingAnchor)
            .bottomAnchor(equalTo: currentMonthInfoWrapperView.layoutMarginsGuide.bottomAnchor)
        
    }
    
    func configureViews() {
        backgroundColor = Styles.viewControllerBackgroundColor
        setupChartView()
    }
    
}


// MARK - Setup
// ---------------------------------
extension InfoView {
    
    func setupChartWith(history: [LightHistory]) {
        
        
        let dataSets = history.enumerated().map { h -> IChartDataSet in
            let index = h.element.label.index(h.element.label.startIndex, offsetBy: 3)
            let label = h.element.label.substring(to: index)
            let dataSet = BarChartDataSet(values: [BarChartDataEntry(x: Double(h.offset),
                                                                     y: Double(h.element.value))], label: label)
            dataSet.label = label
            return dataSet
        }
        
        let data = BarChartData(dataSets: dataSets)
        data.setValueTextColor(.white)
        data.dataSets.forEach { $0.setColor(Styles.tintColor) }
        chartView.data = data
        
        //setup labels
        let labels = history.map { (h) -> String in
            let index = h.label.index(h.label.startIndex, offsetBy: 3)
            return h.label.substring(to: index)
        }
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
        
        //refresh chart
        chartView.notifyDataSetChanged()
        chartView.data?.notifyDataChanged()
    }
    
    fileprivate func setupChartView() {
        
        chartView.fitBars = true
        chartView.scaleXEnabled = false
        chartView.scaleYEnabled = false
        
        chartView.leftAxis.drawLabelsEnabled = true
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = true
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.drawZeroLineEnabled = true
        chartView.leftAxis.labelTextColor = .white
        
        chartView.rightAxis.enabled = false
        
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawLimitLinesBehindDataEnabled = true
        chartView.xAxis.granularity = 1
        
        chartView.xAxis.drawLabelsEnabled = true
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelTextColor = .white
        
        chartView.legend.enabled = false
    }
    
}
