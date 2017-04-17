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
    
    
    var chartView : BarChartView = {
        let view = BarChartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}


// MARK - ViewConfiguration
// ---------------------------------
extension InfoView : ViewConfiguration {
    
    func buildViewHierarchy() {
        addSubview(chartView)
    }
    
    func setupConstraints() {
        chartView
            .topAnchor(equalTo: topAnchor, constant: 60)
            .leadingAnchor(equalTo: leadingAnchor, constant: 10)
            .trailingAnchor(equalTo: trailingAnchor, constant: -10)
            .bottomAnchor(equalTo: bottomAnchor, constant: -60)
    }
    
    func configureViews() {
        backgroundColor = Styles.viewControllerBackgroundColor
        
        setupChartView()
    }
    
}


// MARK - Setup
// ---------------------------------
extension InfoView {
    
    fileprivate func setupChartView() {
        let decSet = BarChartDataSet(values: [BarChartDataEntry(x: 1, y: 31)], label: "Dec")
        decSet.label = "Dec"
        
        let janSet = BarChartDataSet(values: [BarChartDataEntry(x: 2, y: 27)], label: "Jan")
        janSet.label = "Jan"
        
        let febSet = BarChartDataSet(values: [BarChartDataEntry(x: 3, y: 30)], label: "Feb")
        febSet.label = "Feb"
        
        let marSet = BarChartDataSet(values: [BarChartDataEntry(x: 4, y: 34)], label: "Mar")
        marSet.label = "Mar"
        
        let apSet = BarChartDataSet(values: [BarChartDataEntry(x: 5, y: 29)], label: "Apr")
        apSet.label = "Apr"
        
        
        let data = BarChartData(dataSets: [decSet, janSet, febSet, marSet, apSet])
        data.setValueTextColor(.white)
        data.dataSets.forEach { $0.setColor(Styles.tintColor) }
        
        chartView.data = data
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
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: [" ", "Dec", "Jan", "Fev", "Mar", "Apr"])
        chartView.xAxis.drawLabelsEnabled = true
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelTextColor = .white
        
        chartView.legend.enabled = false
        chartView.notifyDataSetChanged()
        chartView.data?.notifyDataChanged()
    }
    
}
