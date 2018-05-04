/*

 MIT License

 Copyright (c) 2016 Maxim Khatskevich (maxim@khatskevi.ch)

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

 */

// Credits:
// http://atimi.com/cap-height-alignment-for-ios-auto-layout/

import UIKit

//---

@IBDesignable
open
class FontAdjustedLabel: UILabel
{
    public
    enum TopAlignmentAdjustment: String
    {
        case none
        case capHeight
        case xHeight
    }

    public
    enum BottomAlignmentAdjustment: String
    {
        case none
        case descender
    }

    //---

    public
    var topAlignmentAdjustment: TopAlignmentAdjustment = .capHeight
    {
        didSet
        {
            setNeedsUpdateConstraints()
        }
    }

    public
    var bottomAlignmentAdjustment: BottomAlignmentAdjustment = .descender
    {
        didSet
        {
            setNeedsUpdateConstraints()
        }
    }

    //---

    open
    override
    var alignmentRectInsets: UIEdgeInsets
    {
        var result = super.alignmentRectInsets

        //---

        guard
            let scale = window?.screen.scale
        else
        {
            return result
        }

        //---

        switch topAlignmentAdjustment
        {
            case .capHeight:

                let lineHeightPx = ceil(font.lineHeight * scale)
                let descenderPx = ceil(-font.descender * scale)
                let capHeightPx = round(font.capHeight * scale)

                result.top = (lineHeightPx - descenderPx - capHeightPx) / scale

            case .xHeight:

                let lineHeightPx = ceil(font.lineHeight * scale)
                let descenderPx = ceil(-font.descender * scale)
                let xHeightPx = round(font.xHeight * scale)

                result.top = (lineHeightPx - descenderPx - xHeightPx) / scale

            default:
                break
        }

        switch bottomAlignmentAdjustment
        {
            case .descender:

                let descenderPx = ceil(-font.descender * scale)

                result.bottom = descenderPx / scale

            default:
                break
        }

        //---

        return result
    }
}
