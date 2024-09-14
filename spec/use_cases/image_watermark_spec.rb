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

require 'spec_helper'

describe 'SlidizeApi' do
    before do
      # run before each test
      @api_instance = SlidizeCloud::SlidizeApi.new
    end

    # unit tests for image_watermark
    # Adds image watermarks and return result.
    # @param documents 
    # @param image 
    # @param [Hash] opts the optional parameters
    # @option opts [ImageWatermarkOptions] :options 
    # @return [File]
    describe 'image_watermark test' do
        it 'should work' do
            document_paths = ["TestData/test.pptx"]
            documents = document_paths.map { |path| File.new(path, 'rb') } 
      
            image =  File.new("TestData/watermark.png", 'rb')

            watermark_options = SlidizeCloud::ImageWatermarkOptions.new
            watermark_options.angle = -45
            watermark_options.zoom = 50
            options = { options: watermark_options }
      
            result = @api_instance.image_watermark(documents, image, options)
            expect(result).not_to be_nil

        ensure
            documents.each(&:close)
            image.close
        end
    end

    # unit tests for image_watermark_with_http_info
    # Adds image watermarks and return result.
    # @param documents 
    # @param image 
    # @param [Hash] opts the optional parameters
    # @option opts [ImageWatermarkOptions] :options 
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    describe 'image_watermark_with_http_info test' do
        it 'should work' do
            document_paths = ["TestData/test.pptx"]
            documents = document_paths.map { |path| File.new(path, 'rb') } 
      
            image =  File.new("TestData/watermark.png", 'rb')

            watermark_options = SlidizeCloud::ImageWatermarkOptions.new
            watermark_options.angle = -45
            watermark_options.zoom = 50
            options = { options: watermark_options }
      
            result = @api_instance.image_watermark_with_http_info(documents, image, options)
            expect(result).not_to be_nil
            expect(result).to be_a(Array)
            expect(result[1]).to eq(200)

        ensure
            documents.each(&:close)
            image.close
        end
    end
end