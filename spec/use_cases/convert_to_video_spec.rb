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

    # unit tests for convert_to_video
    # Converts file provided in the request body into video.
    # @param document 
    # @param [Hash] opts the optional parameters
    # @option opts [VideoOptions] :options 
    # @return [File]
    describe 'convert to video test' do
        it 'should work' do
            document = File.new("TestData/test.pptx", 'rb')

            video_options = SlidizeCloud::VideoOptions.new
            video_options.duration = 5
            video_options.transition = 2
            video_options.resolution_type = "SD"
            video_options.transition_type = "DISSOLVE"
            options = { options: video_options }

            result = @api_instance.convert_to_video(document, options)
            expect(result).not_to be_nil

        ensure
            document&.close
        end
    end

     # unit tests for convert_to_video_with_http_info
    # Converts file provided in the request body into video.
    # @param document 
    # @param [Hash] opts the optional parameters
    # @option opts [VideoOptions] :options 
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    describe 'convert_to_video_with_http_info test' do
        it 'should work' do
            document = File.new("TestData/test.pptx", 'rb')

            video_options = SlidizeCloud::VideoOptions.new
            video_options.duration = 5
            video_options.transition = 2
            video_options.resolution_type = "SD"
            video_options.transition_type = "DISSOLVE"
            options = { options: video_options }

            result = @api_instance.convert_to_video_with_http_info(document, options)
            expect(result).not_to be_nil
            expect(result).to be_a(Array)
            expect(result[1]).to eq(200)

        ensure
            document&.close
        end
    end
end