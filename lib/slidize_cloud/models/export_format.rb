=begin
/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Smallize">
 *   Copyright (c) 2024 Slidize for Cloud
 * </copyright>
 * <summary>
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 * 
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 * 
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 * </summary>
 * --------------------------------------------------------------------------------------------------------------------
 */
=end

require 'date'
require 'time'

module SlidizeCloud
  class ExportFormat
    ODP = "Odp".freeze
    OTP = "Otp".freeze
    PPTX = "Pptx".freeze
    PPTM = "Pptm".freeze
    POTX = "Potx".freeze
    PPT = "Ppt".freeze
    PPS = "Pps".freeze
    PPSM = "Ppsm".freeze
    POT = "Pot".freeze
    POTM = "Potm".freeze
    PDF = "Pdf".freeze
    XPS = "Xps".freeze
    PPSX = "Ppsx".freeze
    TIFF = "Tiff".freeze
    HTML = "Html".freeze
    SWF = "Swf".freeze
    TXT = "Txt".freeze
    DOC = "Doc".freeze
    DOCX = "Docx".freeze
    BMP = "Bmp".freeze
    JPEG = "Jpeg".freeze
    PNG = "Png".freeze
    EMF = "Emf".freeze
    WMF = "Wmf".freeze
    GIF = "Gif".freeze
    EXIF = "Exif".freeze
    ICO = "Ico".freeze
    SVG = "Svg".freeze

    def self.all_vars
      @all_vars ||= [ODP, OTP, PPTX, PPTM, POTX, PPT, PPS, PPSM, POT, POTM, PDF, XPS, PPSX, TIFF, HTML, SWF, TXT, DOC, DOCX, BMP, JPEG, PNG, EMF, WMF, GIF, EXIF, ICO, SVG].freeze
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      return value if ExportFormat.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #ExportFormat"
    end
  end
end
