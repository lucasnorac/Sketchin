//
//  DrawView.swift
//  Sketchin
//
//  Created by Lucas Caron Albarello on 28/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit

class DrawView : ShadowView{
    
    var isDrawing = false
    var lastPoint : CGPoint!
    var lineColor : CGColor = UIColor.black.cgColor
    var lines = [Line]()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isDrawing else {return}
        isDrawing = true
        guard let touch = touches.first else {return}
        let currentPoint = touch.location(in: self)
        lastPoint =  currentPoint
        print(currentPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDrawing else {return}
        guard let touch = touches.first else {return}
        let currentPoint = touch.location(in: self)
        let line = Line(startPoint: lastPoint, endPoint: currentPoint, color: lineColor)
        lines.append(line)
        lastPoint =  currentPoint
        setNeedsDisplay()
        print(currentPoint)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDrawing else {return}
        isDrawing = false
        guard let touch = touches.first else {return}
        let currentPoint = touch.location(in: self)
        let line = Line(startPoint: lastPoint, endPoint: currentPoint, color: lineColor)
        lines.append(line)
        lastPoint = nil
        print(currentPoint)
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(10)
        context?.setLineCap(.round)
        for line in lines {
            context?.beginPath()
            context?.move(to: line.startPoint)
            context?.addLine(to: line.endPoint)
            context?.setStrokeColor(line.color)
            context?.strokePath()
        }
    }
    func excluir(){
        lines = []
        lineColor = UIColor.black.cgColor
        setNeedsDisplay()
    }
}
