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

    # unit tests for protect
    # Protects presentation with specified password and returns result.
    # @param document 
    # @param [Hash] opts the optional parameters
    # @option opts [ProtectionOptions] :options 
    # @return [File]
    describe 'protect test' do
        it 'should work' do
            document =  File.new("TestData/test.pptx", 'rb')

            protection_options = SlidizeCloud::ProtectionOptions.new
            protection_options.view_password = "password"
            protection_options.edit_password = "password"
            protection_options. mark_as_final = true
            options = { options: protection_options }

            result = @api_instance.protect(document, options)
            expect(result).not_to be_nil

        ensure
            document&.close
        end

        # unit tests for protect_with_http_info
        # Protects presentation with specified password and returns result.
        # @param document 
        # @param [Hash] opts the optional parameters
        # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
        describe 'protect_with_http_info test' do
            it 'should work' do
                document =  File.new("TestData/test.pptx", 'rb')

                protection_options = SlidizeCloud::ProtectionOptions.new
                protection_options.view_password = "password"
                protection_options.edit_password = "password"
                protection_options. mark_as_final = true
                options = { options: protection_options }

                result = @api_instance.protect_with_http_info(document, options)
                expect(result).not_to be_nil
                expect(result).to be_a(Array)
                expect(result[1]).to eq(200)

            ensure
                document&.close
            end
        end
    end
end